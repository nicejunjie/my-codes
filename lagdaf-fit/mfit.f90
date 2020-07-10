program mfit
  use pfit
  use lfit
  use modcoor ! contains global variables
  implicit none
 
  integer     :: norder 
  integer     :: i
  real(dp), allocatable :: a(:)
  character(32) :: arg
  real(dp) ::  error
  logical :: iflag=.false.,ifpoly=.false.

  !iargc()
  call getarg(1,arg) 
  read(arg,*) norder
  if(norder .eq. 0) then
        iflag=.true.
  else   
        ifpoly=.true.
  endif

  call llread()

  if(ifpoly) then 
    allocate (a(norder+1))
    a =  polyfit(x, y,norder,error)
    write (*, '(e15.8,$)') a(1)
    do i=2,norder+1
        write (*, '(A,e15.8,A,I2,$)') " + ", a(i),"*x**",i-1
    enddo
    print *,""
    write(*,'(F15.8)') error
  endif



  if(iflag) then 
    allocate (a(N))
    a=lagfit(x,y,N,error)
    do i=1,N 
       write(*,'(F15.8,3x,E15.8)') x(i), a(i)
    enddo
  endif


end program



