subroutine check()

use commonv
use checkv

implicit none

! check whether the criteria has been met.

integer :: i, j ,iokrmsd,iokave
real(8) :: drmsd, dave

ave = 0.0
rmsd = 0.0

do i =1, N 
  do j = 1, i-1
    ave = ave + dist_matrix(i,j)
  end do
end do 
ave = ave/(N*N-N)*2

do i =1, N 
  do j = 1, i-1
    rmsd = rmsd + (ave - dist_matrix(i,j))**2
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
print '(a10,2x,F15.8,a10,2x,F15.8)', 'delta-rmsd', drmsd, 'delta-ave', dave
end if

call debug_print(iop,'in check')


end subroutine check
