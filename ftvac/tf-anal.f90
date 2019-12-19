Program tf_only

  implicit none

  integer,parameter :: dp=selected_real_kind(14)
  integer :: OMP_GET_NUM_THREADS , OMP_GET_THREAD_NUM, nthreads, ntnumber
  integer :: i,j,k,l,ntimes,ndims,nfreqs,nevery,nbox,nnewtimes,calc,mweigh
  integer,allocatable::am(:) , nf(:)
  real(dp) :: dt,freqmax,twopi,deri,derk, t1,t2
  real(dp),allocatable::v(:,:),x(:,:),y(:,:),e(:,:),freq(:),ff(:,:),stdevf(:),stdevf2(:)
  character(len=30)::xx,zz
  character(len=30)::prefix
  character(len=40)::tf_mat,tf_dat,ff_mat,ff_dat
  
  read(*,*) dt, ntimes, ndims, freqmax, nfreqs, nevery, nbox, mweigh
  allocate( am(ndims) )
  if( mweigh == 0 )then
     read(*,*) ( am(j) , j = 1 , ndims )
  else
     am = 1d0
  end if


  nnewtimes = (ntimes-nbox) / nevery
  if (nnewtimes == 0) nnewtimes = 1

  ! allocate arrays
  allocate(v(ntimes,ndims),x(nfreqs,ndims),y(nfreqs,ndims),freq(nfreqs),e(nfreqs,nnewtimes+1))

     do i = 1 , ntimes
        read(*,*) ( v(i,j) , j = 1 , ndims )
     end do
     ! Initialize values.
     twopi = datan(1.0d0)*8.0d0
     x = 0d0 ; y = 0d0 ; e = 0d0 ; freq = 0d0

!$acc data create(freq) copyout(freq)  copy(e,x,y ) copyin(v,am)
     !$ACC KERNELS
     do  k = 1 , nfreqs
        freq(k) = freqmax * float(k-1) / float(nfreqs-1)
     enddo
     do  k = 1 , nfreqs
        do j = 1 , ndims
           do i = 1 , nbox
              t1=twopi*freq(k)*dt*i
              x(k,j) = x(k,j) + cos(t1)*v(i,j)
              y(k,j) = y(k,j) + sin(t2)*v(i,j)
           end do
           e(k,1) = e(k,1) + float(am(j))*(x(k,j)**2 + y(k,j)**2)
        end do
     end do
     !$ACC END KERNELS

     !Comupute t v. f and f v. f spectra.a
     if (nnewtimes > 1) then
        l_loop: do l = 1 , nnewtimes
           !$ACC KERNELS
           k_loop: do k = 1 , nfreqs
              j_loop : do j = 1 , ndims
                 i_loop: do i = nbox+1+nevery*(l-1) , nbox+nevery*l
                    t1=twopi*freq(k)*dt*i
                    t2=twopi*freq(k)*dt*nbox
                    x(k,j) = x(k,j) + cos(t1) * v(i,j) - cos(t1-t2) * v(i-nbox,j)
                    y(k,j) = y(k,j) + sin(t2) * v(i,j) - sin(t1-t2) * v(i-nbox,j)
                 end do i_loop
                 e(k,l+1) = e(k,l+1) + float(am(j))*(x(k,j)**2 + y(k,j)**2)
              end do j_loop
           end do k_loop
           !$ACC END KERNELS
        end do l_loop
     endif

!$acc end data

     e = e/2.0d0/float(nbox)**2

     !Print the mat format results in fort.213.
     !Print the dat format results in fort.204.
     write(xx,fmt="(a,i4,a)")'(',nnewtimes+1,'(1pe15.8,2x))'
     write(zz,fmt="(a,i4,a)")'(i4,',nnewtimes,'(1pe15.8,2x))'
     open(unit=213)!,file=tf_mat,status='unknown')
     open(unit=204)!,file=tf_dat,status='unknown')
     write(213,zz) nnewtimes+1 , ( float(l-1)*dt*float(nevery),l = 1 , nnewtimes )
     do k = 1 , nfreqs
        write(213,xx) freq(k) , ( e(k,l) , l = 1 , nnewtimes )
        do l = 1 , nnewtimes
           write(204,fmt="(3(1pe15.8,2x))") freq(k) , float(l-1)*dt*float(nevery) , e(k,l)
        end do
        if (nnewtimes > 1) write(204,*) " "
     end do
     if ( calc == 1) calc = calc + 3
     deallocate(v)
     close(213);close(204)
     
end Program tf_only

   
