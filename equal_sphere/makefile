
COMPILER = GNU

CC_PGI = pgcc
FC_PGI = pgfortran
FFLAGS_PGI = -fast -mp -Minfo=all

CC_GNU = gcc
FC_GNU = gfortran
FFLAGS_GNU =  -Ofast -fopenmp -g

CC = $(CC_$(COMPILER))
FC = $(FC_$(COMPILER))
FFLAGS = $(FFLAGS_$(COMPILER))


$(compiler is $(COMPILER))

OBJ = commonv.o calc_force.o check.o debug_print.o dist.o genxyz.o inirand.o initialize.o lowercase.o main.o move.o norm.o printstat.o projection.o readkey.o

TARGET = eqpt

LIBS = 
INCLUDE = 

${TARGET} : $(OBJ) 
	$(FC) -o $@  $^ $(FFLAGS) $(LIBS)

%.o     : %.f90  $(DEPS)
	$(FC) -c -o $@ $< $(FFLAGS)	

.PHONY: clean

clean :
	rm *.o *.mod $(TARGET)


