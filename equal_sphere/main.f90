program equal_sphere

! this program is used to generate equally spaced points on sphere.
! it optimizes a set of point charges to equilibrium, controlled by convergence criteria. 
! iop controls the output level
! written by Junjie,  Apr-someday-2012. 

use commonv
use checkv

implicit none


call initialize()

do 

 call calc_force()
 call dist()
 call check()
 if((iok.eq.1).or.(istep.ge.maxstep)) exit
 call move()

 istep = istep + 1

enddo

call print_stat()


end program equal_sphere
