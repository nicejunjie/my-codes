n=6
!this is comment
thre=1.0d-8
stepsize=1.0d-4
maxstep = 10000000
radius=1
iop=1010
!iop=abcd    a->convergence info,  b-> force, c ->distmatrix  ,  d -> coordinate
!end with empty line



