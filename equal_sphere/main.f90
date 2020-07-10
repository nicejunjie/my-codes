program equal_sphere

! this program is used to generate equally spaced points on sphere.
! it optimizes a set of point charges to equilibrium, controlled by convergence criteria. 
! iop controls the output level
! written by Junjie,  Apr-someday-2012. 

use commonv
use checkv

implicit none


call initialize()
call genxyz()

do 
 call calc_force()
 call dist()
 call check()
 call move()
 call norm()
 if((iok.eq.1).or.(istep.gt.maxstep)) exit
 if(iop.ne.0) print '(a11,2x,I10,a14,2x,I10)', 'step number',istep, 'out of maxstep', maxstep
 istep = istep + 1
enddo

call print_stat()


end program equal_sphere
