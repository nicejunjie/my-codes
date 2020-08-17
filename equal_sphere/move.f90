subroutine move ()

use commonv

implicit none


integer :: i

do i = 1 , N

 coor(1,i) = coor(1,i) + force(1,i)*stepsize
 coor(2,i) = coor(2,i) + force(2,i)*stepsize
 coor(3,i) = coor(3,i) + force(3,i)*stepsize

end do

call norm()

end subroutine move

