subroutine calc_force()

use commonv

implicit none

integer ::  i,j, itmp
real(8) :: x , y , z, r 

dist_matrix=0.0
force=0.0
do i=1,N
  do j=1,i-1
     if(i.ne.j) then
      x=coor(1,i)-coor(1,j)
      y=coor(2,i)-coor(2,j)
      z=coor(3,i)-coor(3,j)
      r=sqrt(x*x+y*y+z*z)
      itmp=i*(i-1)/2+j
      dist_matrix(itmp) = r
      force(1,i)= force(1,i) + x/r
      force(2,i)= force(2,i) + y/r
      force(3,i)= force(3,i) + z/r
      force(1,j)= force(1,j) - x/r
      force(2,j)= force(2,j) - y/r
      force(3,j)= force(3,j) - z/r
     end if
    end do
end do

end subroutine calc_force
