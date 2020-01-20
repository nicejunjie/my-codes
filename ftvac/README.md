FTVAC/FTDAC code:

Auto correlation function of velocity or dipole. 

Capable of generating tranditional 1D vibrational spectra or 2D time evolution spectra. 


*OpenMP:

 Using GNU compiler:
 gfortran -Ofast -march=native -fopenmp <br />
 real	1m56.649s

 Using Intel compiler:
 -ifort -ansi-alia -qopenmp   -O3  -no-prec-div  -no-prec-sqrt  -fp-model fast=2  -xHost  <br />
 real	0m33.888s

 Using PGI compiler:
 pgf90 -fast -Mfprelaxed -mp   <br />
 real 0m50.035s

*OpenACC:

 Using PGI compiler:
 pgf90 -fast -Mfprelaxed -acc   <br />
 real	0m10.610s

 Using PGI compiler:
 pgif90 -fast -Mfprelaxed -acc -ta=multicore  <br />
 real	0m57.949s

