module  lfit
contains


 function lagfit(vx,vy,N,error)
    integer, parameter                    :: dp = selected_real_kind(15, 307)
    real(dp), parameter :: efac= 0.1
    real(dp), dimension(N)              :: lagfit
    real(dp), dimension(:), intent(in)    :: vx, vy
    real(dp) :: p,error
    integer :: i,j,k
    error=0.0
    do i=1,N 
        lagfit(i)=0.0 
        do j=1,N
          p=1.0
          do k=1,j-1 
              p=p*(vx(i)-vx(k))/(vx(j)-vx(k))
          enddo
          do k=j+1,N
              p=p*(vx(i)-vx(k))/(vx(j)-vx(k))
          enddo
          lagfit(i)=lagfit(i) + vy(j)*p *exp(-efac*(vx(i)-vx(j))**2)
        enddo
        error=error+ abs(lagfit(i)-vy(i))
        print *,lagfit(i)
    enddo
    error=error/N
       
 end function

end module
