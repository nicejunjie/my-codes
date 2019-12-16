// generalized oniom code
// the following new features are avaiable:
// link atom (C-C, C-N, N-C only)
// single-layer admp


#include <boost/multiprecision/cpp_int.hpp>  
#include "keywords.h"
#include "util.h"
#include "const.h"
#include "common.h"
#include "build_frag.h"

#include "mpi_util.h"

using namespace std; 
using namespace boost::multiprecision;

int main(int argc,char*argv[]){
 void readin ();
 void check_job_type();
 void goniom_run();
 void output ();


MPI::Init(argc,argv);
mpi_np=MPI::COMM_WORLD.Get_size();
mpi_id=MPI::COMM_WORLD.Get_rank();


 readin();
 check_job_type();
 combination();
 goniom_run();

if(mpi_id==0)  output();

MPI::Finalize();
return 0;

}

