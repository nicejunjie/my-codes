LIB = -mkl
FC = ifort
mfit.x : modcoor.f90  llread.f90   polyfit.f90 lagfit.f90  mfit.f90
	$(FC) -o mfit.x modcoor.f90 llread.f90  polyfit.f90  lagfit.f90 mfit.f90  $(LIB) 

