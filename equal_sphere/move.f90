subroutine move ()

use commonv

implicit none


integer :: i

do i = 1 , N

 coor(1,i) = coor(1,i) + force(1,i)*stepsize*radius*0.1
 coor(2,i) = coor(2,i) + force(2,i)*stepsize*radius*0.1
 coor(3,i) = coor(3,i) + force(3,i)*stepsize*radius*0.1

end do

end subroutine move

