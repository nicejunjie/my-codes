#include <iostream>
#include <vector>
#include <cmath>
#include <string>
#include <stdlib.h>
#include <sstream>
#include <fstream>
#include <stdio.h>
#include <iomanip>
#include <limits.h>
#include <bitset> //print binary numbers
#include <boost/multiprecision/cpp_int.hpp>  //big integer lib
// #include <unordered_map>

#include "keywords.h"
#include "util.h"
#include "const.h"
#include "common.h"
#include "mpi_util.h"

using namespace std; 
using namespace boost::multiprecision;


//--------------------------/
string run(string cmd,string input,string outname) { 
// this function would run "cmd", and return the output of cmd. "input" is the input file which cmd will use to run. "outname" is the name of the output file. input and output should be consistant with "cmd".
  if(ifDebug) cout<<"debug in run"<<endl;
  FILE *in; 
  char buff[512];
  string res;
  const char *cmdstr;
  cmdstr=cmd.c_str();

// ofstream outfile(outname);
 ofstream outfile(outname.c_str());   //for old c++ compiler
  outfile<<input;
  outfile.flush();
  outfile.close();

 while(res=="") {                         // for unknown reason, gaussian job will randomly fail to run during dynamics. rerun it if fails.
  if(!(in=popen(cmdstr,"r"))) gexit("fail to run popen"); 
  while(fgets(buff,sizeof(buff),in)) res+=buff;
 }
 // stringstream is(buff);
 // is>>res;
// cout<<res<<endl;
  if(ifDebug) cout<<"finishing run"<<endl;
  if(ifDebug) cout<<res<<endl;
  return res;
}


//--------------------------
string calc_chg(string str) {   // this needs to be moved to gen_sub.cpp
// need to use harsh table in the future for simplicity. 
  if(ifDebug) cout<<"debug in calc_chg"<<endl;
 string stmp;
 if(ifWater) {
   int n_O=0 ,n_H=0;
   int c_O=-2,c_H=1;
   stringstream is(str);
   while(is>>stmp){
      if(stmp=="O"||stmp=="8") n_O++;
      else if(stmp=="H"||stmp=="1") n_H++;
      else gexit("nyi");
      is>>stmp;is>>stmp;is>>stmp; //skip coordinates[3]
   }
   return itos(n_O*c_O+n_H*c_H);
 }
 if(ifPeptide) { 
// nasty. not working.
   stringstream is(str);
   int iatm = 0;
   while(is>>stmp){
      if(stmp=="O"||stmp=="8") ;
      else if(stmp=="H"||stmp=="1") ;
      else if(stmp=="C"||stmp=="6")  
               if(connect[iatm].size()==3) { 
                    int itmp=0;
                    for(int j=0;j<3;j++)  { 
                       int icon=connect[iatm][j];
                       if(atmname[icon]=="O"||atmname[icon]=="8") itmp+=connect[icon].size();
                    }
                    if(itmp==2) return "-1";
               }
      else if(stmp=="N"||stmp=="7") if(connect[iatm].size()==4) return "1";
      else if(stmp=="S"||stmp=="16") ;
      else gexit("nyi");
      is>>stmp;is>>stmp;is>>stmp; //skip coordinates[3]
      iatm++;
   }
   return "0";
 }
}


//--------------------
string bg_pcharge (int n) {
 if(ifDebug) cout<<"test in bg_pcharge"<<endl;
  string res;
  cpp_int k,t; 
  t= ~mp[n-1];
  k=1;
  for(int i=0;i<natm;i++) { 
      if(k&t) res=res+" "+dtos(geom[i][0])+" "+dtos(geom[i][1])+" "+dtos(geom[i][2])+" "+ dtos(pcharge[i])+'\n';
   k=k*2;
// k<<1 has problem. << Op is not overloaded  properly for un-signed long long int. 
  }
  return res;
}
//--------------------------/

void  goniom_run(){
  if(ifDebug) cout<<"debug in goniom_run"<<endl;
// construct gaussian input files, run and extrapolate goniom energy.
string f1,f2,fout;
string cmd,str; 
double e,f;
stringstream is;

string s_getE_high=sjob[ijob[0]];
string s_getE_low=sjob[ijob[1]];

if(mpi_id==0) {
if(!ifAdmp) {
  f1=low+'\n'+title+'\n'+mulchg+sub_subsys[0]+'\n'+'\n';
  fout="tmp"+itos(0);
  cmd=" gdv<"+fout+".com>&"+fout+".log;cat "+fout+".log|"+s_getE_low;
  if(ifForce) cmd+=";cat " +fout+".log|"+s_getF;
  if(ifCharge) cmd=cmd+";cat " +fout+".log|"+s_getQ;
  if(ifDipole) cmd=cmd+";cat " +fout+".log|"+s_getD;
  str=run(cmd,f1,fout+".com");
  is<<str;
  is>>pot;
  if(ifForce) { 
      for(int j=0;j<natm;j++) {
             for(int k=0;k<3;k++) { 
               is>>f; 
               force[j*3+k]=f;
             }
      }
   }
// read Mulliken charge from low leve calculation.
  if(ifCharge) { 
     for(int j=0;j<natm;j++) { 
       is>>f;
       pcharge[j]=f; 
     }
  }
 
  if(ifDipole) { 
             for(int k=0;k<3;k++) { 
               is>>f; 
               dipole[k]=f;
             }
   }
} //admp
} //mpi_id
//MPI_Barrier(MPI_COMM_WORLD); //wait for all processes.
if(ifCharge) { 
 //bcast charge info
 gexit("nyi EE MPI");
}

if(sub_subsys.size()!=eflag.size()) gexit("unknown error");

// now do all the fragments with optional EE.
for(int i=mpi_id+1;i<sub_subsys.size();i+=mpi_np) {
   if(ifDebug) cout<<"doing sub system number "<<i<<" on processor "<<mpi_id<<endl;
   if(ifWater||ifPeptide)  mulchg=calc_chg(sub_subsys[i]) + "  1"+'\n';         //calc_chg is written specifically for water. comment this for other systems.
   if(!ifCharge) {
     f1=high+'\n'+title+'\n'+mulchg+sub_subsys[i]+'\n'+'\n';
     f2=low+'\n'+title+'\n'+mulchg+sub_subsys[i]+'\n'+'\n';
   }
   else { 
     str=bg_pcharge(i);
     f1=high+" charge\n"+'\n'+title+'\n'+mulchg+sub_subsys[i]+'\n'+str+'\n'+'\n';
     f2=low +" charge\n"+'\n'+title+'\n'+mulchg+sub_subsys[i]+'\n'+str+'\n'+'\n';
   }
// high 
   fout="tmp"+itos(i)+"-h";
   cmd=" gdv<"+fout+".com>&"+fout+".log;cat "+ fout+".log|"+s_getE_high;
   if(ifForce) cmd+=";cat " +fout+".log|"+s_getF;
   str=run(cmd,f1,fout+".com");
   is.str("");is.clear();
   is<<str;
   is>>e;
   pot+=e*eflag[i];
   if(ifForce) { 
          cpp_int m=1;
      for(int j=0;j<natm;j++) {
  //      cpp_int m=1<<j;
         if(m&mp[i-1]) 
             for(int k=0;k<3;k++) { 
               is>>f; 
               force[j*3+k]+=f*eflag[i];
             }
           m*=2;
      }
      if(ifLink) {          // read link atom forces if there is any.
        for(int j=0;j<link_atom[i-1].size();j++) { 
             for(int k=0;k<3;k++) { 
               is>>f; 
               int ia,ib ; 
               ia=link_atom[i-1][j][0];   //i-th fragment, j-th link atom.    c array index starts from 0.
               ib=link_atom[i-1][j][1];
               link_c1=1.0-link_scale[i-1][j];
               link_c2=link_scale[i-1][j];
               force[ia*3+k]+=f*eflag[i]*link_c1;
               force[ib*3+k]+=f*eflag[i]*link_c2;
             }
        }
      }
   }
   if(ifDipole) { 
           for(int k=0;k<3;k++) { 
             is>>f; 
             dipole[k]+=f*eflag[i];
           }
   }
// low
   fout="tmp"+itos(i)+"-l";
   cmd=" gdv<"+fout+".com>&"+fout+".log;cat "+ fout+".log|"+s_getE_low;
   if(ifForce) cmd+=";cat " +fout+".log|"+s_getF;
   str=run(cmd,f2,fout+".com");
   is.str("");is.clear();
   is<<str;
   is>>e;
   pot+=-e*eflag[i];
   if(ifForce) { 
         cpp_int m=1;
      for(int j=0;j<natm;j++) {
       //  int m=1<<j;
         if(m&mp[i-1])  
             for(int k=0;k<3;k++) { 
               is>>f; 
               force[j*3+k]+=-f*eflag[i];    // attention, this is -f. 
             }
         m*=2; 
      }
      if(ifLink) {
        for(int j=0;j<link_atom[i-1].size();j++) { 
             for(int k=0;k<3;k++) { 
               is>>f; 
               int ia,ib ; 
               ia=link_atom[i-1][j][0];   //i-th fragment, j-th link atom
               ib=link_atom[i-1][j][1];
               link_c1=1.0-link_scale[i-1][j];
               link_c2=link_scale[i-1][j];
               force[ia*3+k]+=-f*eflag[i]*link_c1;
               force[ib*3+k]+=-f*eflag[i]*link_c2;
             }
        }
      }

   }
   if(ifDipole) { 
           for(int k=0;k<3;k++) { 
             is>>f; 
             dipole[k]+=-f*eflag[i];
           }
   }
}  // loop for each frags

double pot_global;
double force_global[natm*3];
MPI_Reduce(&pot,&pot_global,1,MPI_DOUBLE,MPI_SUM,0,MPI_COMM_WORLD);
pot=pot_global;
MPI_Reduce(force,force_global,3*natm,MPI_DOUBLE,MPI_SUM,0,MPI_COMM_WORLD);
pot=pot_global;
std::copy(force_global,force_global+3*natm,force);

}


