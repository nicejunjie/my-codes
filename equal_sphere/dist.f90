subroutine dist()

use commonv

implicit none

integer ::  i,j, itmp
real(8) :: x , y , z, r 

energy = 0.0d0

do i=1,N
  do j=1,i-1
     if(i.ne.j) then
      x=coor(1,i)-coor(1,j)
      y=coor(2,i)-coor(2,j)
      z=coor(3,i)-coor(3,j)
      r=sqrt(x*x+y*y+z*z)
      itmp=i*(i-1)/2+j
      dist_matrix(itmp) = r
      energy = energy - 1/r
     end if
    end do
end do

end subroutine dist
