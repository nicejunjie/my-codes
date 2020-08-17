subroutine check()

use commonv
use checkv

implicit none

! check whether the criteria has been met.

integer :: i, j ,iokrmsd,iokave, itmp
real(8) :: drmsd, dave

ave = 0.0
rmsd = 0.0
iokrmsd=0
iokave=0

do i =1, N 
  do j = 1, i-1
    itmp=i*(i-1)/2+j
    ave = ave + dist_matrix(itmp)
  end do
end do 
ave = ave/(N*N-N)*2

do i =1, N 
  do j = 1, i-1
    itmp=i*(i-1)/2+j
    rmsd = rmsd + (ave - dist_matrix(itmp))**2
  end do
end do 
rmsd = rmsd/(N*N-N)*2
rmsd = sqrt(rmsd)


!need to add force check

drmsd=abs(rmsd-rmsd_old)
dave=abs(ave-ave_old)
rmsd_old=rmsd
ave_old=ave

if(drmsd.lt.threshold) iokrmsd = 1
if(dave.lt.(threshold/N)) iokave = 1
if(iokrmsd*iokave.eq.1) iokcount=iokcount+1
if(iokcount.eq.4) iok=1

!if(rmsd.lt.threshold) iok=1
! print *, 'rmsd, and ave' , rmsd,ave

! print *,'step ' ,istep, 'out of maxstep',maxstep
!print *, 'rmsd_old, and ave_old',rmsd_old,ave_old
!print *, 'rmsd and ave        ', rmsd, ave
if(iop.ne.0) then
  print '( "-------------------","step ", I8,"-------------------")', istep
  print '("step number",I10,2x,"out of maxstep",I10,2x,"energy=",F30.10)', istep, maxstep, energy
  print '(a10,2x,E15.8,a10,2x,E15.8,a10,2x,E15.8)', 'delta-rmsd', drmsd, 'delta-ave', dave, 'threshold', threshold
  print *, "------------------------------------------------------"


end if

call debug_print(iop,'in check')


end subroutine check
