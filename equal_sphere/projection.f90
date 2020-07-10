subroutine projection()

use commonv

implicit none

! this subroutine projects the cartesian forces to spherical coordinate.

! new forces are save in the order of  r, theta, phi

real(8) :: f_theta, f_phi, f_r, r, x, y ,z, fx,fy,fz
real(8) :: theta, phi, sin_theta, cos_theta, sin_phi, cos_phi 
integer :: i

print *, 'projected force on spherical coordinate'
print *, 'f_r        f_theta         f_phi '
do i =1, N
  x=coor(1,i)
  y=coor(2,i)
  z=coor(3,i)
  r=sqrt(x*x+y*y+z*z)
  theta=acos(z/r)
  phi=atan2(y,x)+asin(1.0)*2.0
  sin_theta=sin(theta)
  cos_theta=cos(theta)
  sin_phi=sin(phi)
  cos_phi=cos(phi)
  fx=force(1,i)
  fy=force(2,i)
  fz=force(3,i)
  
  f_r = fx*cos_phi*sin_theta + fy*sin_phi*sin_theta + fz*cos_theta
  f_theta = fx*r*cos_phi*cos_theta + fy*r*sin_phi*cos_theta - fz*r*sin_theta
  f_phi = -fx*r*sin_phi*sin_theta + fy*r*cos_phi*sin_theta
  
  print '(3(F15.8))',f_r,f_theta,f_phi
end do


end subroutine projection
