module commonv
real(8) :: threshold = 1d-4, &
           stepsize  = 1d-1, &
           radius    = 1d0
integer :: N     , &
           istep = 0, &
           iok   = 0 , &
           iop   = 0 , &
           Maxstep = 1000000
real(8),allocatable :: dist_matrix(:,:), coor(:,:), force(:,:)
end module commonv


module checkv 
real(8) :: rmsd_old = 0.0, rmsd, ave_old = 0.0 ,ave
integer :: iokcount=0
end module checkv 
