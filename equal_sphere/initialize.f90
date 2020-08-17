subroutine initialize()

use commonv

call readkey()

allocate (force(3,N))
allocate (coor(3,N))
allocate (dist_matrix((N*(N+1))/2))

call genxyz()


end subroutine initialize
