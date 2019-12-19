#!/bin/bash -l 

module load PrgEnv-pgi

pgf90 -fast -Mfprelaxed -acc tf-anal.f90

