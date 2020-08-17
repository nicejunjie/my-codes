subroutine genxyz()

use commonv

! generate random number on a sphere.
! using spherical coordinate
! r, theta [0,pi], phi [0,2*pi)

real(8) :: ran, theta, phi, pi
integer :: i

pi = asin(1.0) *2.0
call init_random_seed()
r=radius

do i = 1 , n
  call random_number(ran)
  print '("***** random number *****", F15.3)' , ran
  theta = ran * pi
  call random_number(ran)
  print '("***** random number *****", F15.3)' , ran
  phi = ran * 2*pi

  coor(1,i)=r*cos(phi)*sin(theta)
  coor(2,i)=r*sin(phi)*sin(theta)
  coor(3,i)=r*cos(theta)

end do

if(iop.ne.0) then
  call debug_print(001,'initial coordinate')
end if


end subroutine genxyz
