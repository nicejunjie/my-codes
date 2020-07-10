subroutine llread()

!linked list read 
   use modcoor
   implicit none

! integer, parameter      :: dp = selected_real_kind(15, 307)
   type node
      real(dp) ::  x,y
      type( node ), pointer :: next
   end type node
 
   type( node ), pointer :: head, current, previous
   integer :: ieof,i
   real(dp) :: t1,t2
   
! real(dp), allocatable :: x(:),y(:)

   nullify( head )   ! Initialize list to point to no target.
   allocate( head )
   nullify( head%next )

   current => head
   N=0
   do 
      read(*,*,iostat=ieof) t1,t2
      if(ieof<0) then
         exit
      endif
      allocate( current%next )
      nullify( current%next%next )
      current%next%x = t1
      current%next%y = t2
      current => current%next
      N = N + 1
   end do

   allocate(x(N))
   allocate(y(N))

   ! Output the list, deallocating them after use.

   current => head%next
   i=1
   do while ( associated( current ) )
      x(i)=current%x
      y(i)=current%y
      previous => current
      current => current%next
      deallocate( previous )
      i = i+1
   end do
      

end

