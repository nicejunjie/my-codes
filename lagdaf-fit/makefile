LIB = -L /home/lijunj/lib/lapack-3.5.0
LIBB = -llapack -lblas
F90 = gfortran
mfit.x : modcoor.f90  llread.f90   polyfit.f90 lagfit.f90  mfit.f90
	$(F90) -o mfit.x modcoor.f90 llread.f90  polyfit.f90  lagfit.f90 mfit.f90  $(LIB) $(LIBB)

