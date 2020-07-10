subroutine norm()

use commonv

real(8) :: r
integer :: i,j

do i =1, N
  r = coor(1,i)**2+coor(2,i)**2+coor(3,i)**2
  r = sqrt(r)
  do j =1,3 
    coor(j,i) = coor(j,i)/r*radius
  end do
end do

end subroutine norm
