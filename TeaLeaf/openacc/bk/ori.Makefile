COMPILER=PGI

ifndef COMPILER
  MESSAGE=select a compiler to compile in OpenMP, e.g. make COMPILER=INTEL
endif

OMP_INTEL     = -openmp
OMP_SUN       = -xopenmp=parallel -vpara
OMP_GNU       = -fopenmp
OMP_CRAY      = -e Z
OMP_PGI       = #-acc -Minfo=acc #-mp=nonuma
OMP_PATHSCALE = -mp
OMP_XL        = -qsmp=omp -qthreaded
OMP=$(OMP_$(COMPILER))

FLAGS_INTEL     = -O3 -ipo -no-prec-div
FLAGS_SUN       = -fast -xipo=2 -Xlistv4
FLAGS_GNU       = -O3 -march=native -funroll-loops
FLAGS_CRAY      = -em -ra -h acc_model=fast_addr:no_deep_copy:auto_async_all
FLAGS_PGI       = -fast 
FLAGS_PATHSCALE = -O3
FLAGS_XL       = -O5 -qipa=partition=large -g -qfullpath -Q -qsigtrap -qextname=flush:timer_c:unpack_top_bottom_buffers_c:pack_top_bottom_buffers_c:unpack_left_right_buffers_c:pack_left_right_buffers_c:field_summary_kernel_c:update_halo_kernel_c:generate_chunk_kernel_c:initialise_chunk_kernel_c:calc_dt_kernel_c -qlistopt -qattr=full -qlist -qreport -qxref=full -qsource -qsuppress=1506-224:1500-036
FLAGS_          = -O3
CFLAGS_INTEL     = -O3 -ipo -no-prec-div -restrict -fno-alias
CFLAGS_SUN       = -fast -xipo=2
CFLAGS_GNU       = -O3 -march=native -funroll-loops
CFLAGS_CRAY      = -em -h list=a
CFLAGS_PGI       = -fastsse -gopt -Mipa=fast -Mlist
CFLAGS_PATHSCALE = -O3
CFLAGS_XL       = -O5 -qipa=partition=large -g -qfullpath -Q -qlistopt -qattr=full -qlist -qreport -qxref=full -qsource -qsuppress=1506-224:1500-036 -qsrcmsg
CFLAGS_          = -O3

ifdef DEBUG
  FLAGS_INTEL     = -O0 -g -debug all -check all -traceback -check noarg_temp_created
  FLAGS_SUN       = -g -xopenmp=noopt -stackvar -u -fpover=yes -C -ftrap=common
  FLAGS_GNU       = -O0 -g -O -Wall -Wextra -fbounds-check
  FLAGS_CRAY      = -O0 -g -em -eD
  FLAGS_PGI       = -O0 -g -C -Mchkstk -Ktrap=fp -Mchkfpstk -Mchkptr
  FLAGS_PATHSCALE = -O0 -g
  FLAGS_XL       = -O0 -g -qfullpath -qcheck -qflttrap=ov:zero:invalid:en -qsource -qinitauto=FF -qmaxmem=-1 -qinit=f90ptr -qsigtrap -qextname=flush:timer_c:unpack_top_bottom_buffers_c:pack_top_bottom_buffers_c:unpack_left_right_buffers_c:pack_left_right_buffers_c:field_summary_kernel_c:update_halo_kernel_c:generate_chunk_kernel_c:initialise_chunk_kernel_c:calc_dt_kernel_c
  FLAGS_          = -O0 -g
  CFLAGS_INTEL    = -O0 -g -debug all -traceback
  CFLAGS_SUN      = -g -O0 -xopenmp=noopt -stackvar -u -fpover=yes -C -ftrap=common
  CFLAGS_GNU       = -O0 -g -O -Wall -Wextra -fbounds-check
  CFLAGS_CRAY     = -O0 -g -em -eD
  CFLAGS_PGI      = -O0 -g -C -Mchkstk -Ktrap=fp -Mchkfpstk
  CFLAGS_PATHSCALE= -O0 -g
  CFLAGS_XL      = -O0 -g -qfullpath -qcheck -qflttrap=ov:zero:invalid:en -qsource -qinitauto=FF -qmaxmem=-1 -qsrcmsg
endif

FLAGS=$(FLAGS_$(COMPILER)) $(OMP) $(I3E) $(OPTIONS)
CFLAGS=$(CFLAGS_$(COMPILER)) $(OMP) $(I3E) $(C_OPTIONS) -c
MPI_COMPILER=mpif90
C_MPI_COMPILER=mpicc

tea_leaf: c_lover *.f90 Makefile
	$(MPI_COMPILER) $(FLAGS)	\
	data.f90			\
	definitions.f90			\
	pack_kernel.f90			\
	tea.f90				\
	report.f90			\
	timer.f90			\
	parse.f90			\
	read_input.f90			\
	initialise_chunk_kernel.f90	\
	initialise_chunk.f90		\
	build_field.f90			\
	update_halo_kernel.f90		\
	update_halo.f90			\
	start.f90			\
	generate_chunk_kernel.f90	\
	generate_chunk.f90		\
	initialise.f90			\
	field_summary_kernel.f90	\
	field_summary.f90		\
	calc_dt_kernel.f90		\
	calc_dt.f90			\
	timestep.f90			\
	set_field_kernel.f90            \
	set_field.f90                   \
	tea_leaf_jacobi.f90             \
	tea_leaf_cg.f90             	\
	tea_leaf_cheby.f90             	\
	tea_leaf_ppcg.f90             	\
	tea_solve.f90                   \
	visit.f90			\
	tea_leaf.f90			\
	diffuse.f90			\
	timer_c.o                       \
	-o tea_leaf
#; echo $(MESSAGE)

c_lover: *.c Makefile
	$(C_MPI_COMPILER) $(CFLAGS)     \
	timer_c.c
Makefile: 

clean:
	rm -f *.o *.mod *genmod* *.lst *.cub *.ptx tea_leaf
