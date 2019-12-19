

CXX=mpic++
OPT= -O2 
EXE=goniom
LIB=
INCLUDE=

%.o: %.cpp
	$(CXX) $(OPT) -c $< -o $@

SRCS = build_frag.cpp  check_job_type.cpp  common.cpp  gen_sub.cpp  goniom_run-mpi.cpp  keywords.cpp  main-mpi.cpp  mpi_util.cpp  output.cpp  readin-mpi.cpp  readkey.cpp  util-mpi.cpp

OBJS = $(SRCS:.cpp=.o)

all: 
	make clean 
	make $(EXE)
$(EXE): $(OBJS) 
	$(CXX) $(OPT) $(INCLUDES) -o $(EXE) $(OBJS) $(LIBS)
.c.o:
	$(CXX) $(OPT) $(INCLUDES) -c $<  -o $@
clean:
	rm -f *.o $(EXE) *.optrpt  
realclean:
	rm -f *.o $(EXE) *.optrpt  

