
CC = gcc
F90 = gfortran

OBJ = commonv.o calc_force.f90  check.f90 debug_print.f90 dist.f90 genxyz.f90 inirand.f90 initialize.f90 lowercase.f90 main.f90 move.f90 norm.f90 printstat.f90 projection.f90 readkey.f90
TARGET = eq.x

install : $(OBJ)
	$(F90) -o $(TARGET)  $(OBJ)
clean :
	rm *.o *.mod
