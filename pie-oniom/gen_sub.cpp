

#include <string>
#include <vector>
#include <sstream>
#include <fstream>
#include <iostream>
#include <cmath>

#include "keywords.h"
#include "util.h"
#include "common.h"


using namespace std;


//------------------------------------/
//test auto subsystem generation.
//------------------------------------

double dist(int ia, int ib){
 double d=0.0;
 for(int j=0;j<3;j++) d+=(geom[ia][j]-geom[ib][j])*(geom[ia][j]-geom[ib][j]); 
 return sqrt(d);
}
//--------------------

bool shareH(int io1, int io2, int ih){
  bool if_share_h=false;
  double OHO_angle_threld = 120, v1[3],v2[3],d1,d2; 
  d1=0.0; d2=0.0;
 for(int j=0;j<3;j++) { 
      v1[j]=geom[io1][j]-geom[ih][j];
      v2[j]=geom[io2][j]-geom[ih][j];
      d1+=v1[j]*v1[j];  
      d2+=v2[j]*v2[j];  
 } 
 d1=sqrt(d1); d2=sqrt(d2); 
 v1[0]/=d1;v1[1]/=d1;v1[2]/=d1;
 v2[0]/=d2;v2[1]/=d2;v2[2]/=d2;

 d1= v1[0]*v2[0]+v1[1]*v2[1]+v1[2]*v2[2];
 if(acos(d1)/3.141592653*180>OHO_angle_threld) if_share_h= true; 

 return if_share_h;
}

//------------------------------------/
void gen_sub() { 
  if(ifDebug) cout<<"debug in gen_sub"<<endl;
  vector <int>  nodeO,nodeH; 
  const double threld=1.10,threldH=1.4;
  double d,d1,d2;
  vector <bool> gsub(natm);
  double dmat[natm][natm];
  subsys.clear();
  nsub=0;
  vector <double> oo_min;
  bool if_share_h;

  ofstream myfile;
  myfile.open("autosub.txt");

  for(int i=0;i<natm;i++) {
    for(int j=i+1;j<natm;j++) {
         dmat[i][j]=dist(i,j); 
         dmat[j][i]=dmat[i][j]; 
    }
  }
  for(int i=0;i<natm;i++) { 
      if(atmname[i]=="O"||atmname[i]=="8")  nodeO.push_back(i);  
      else if(atmname[i]=="H"||atmname[i]=="1")  nodeH.push_back(i);
      else gexit("unrecoginized atom");
  }
  for(int io=0;io<nodeO.size();io++) { 
       double min=10000.0;
       for(int io2=0;io2<nodeO.size();io2++) { 
           if(io!=io2 && min>dmat[nodeO[io]][nodeO[io2]]) min=dmat[nodeO[io]][nodeO[io2]]; 
       }
       oo_min.push_back(min);
  }
  for(int io=0;io<nodeO.size();io++) { 
         for(int io2=0;io2<nodeO.size();io2++) {
            if(io!=io2 && dmat[nodeO[io]][nodeO[io2]]<oo_min[io]*threld && dmat[nodeO[io]][nodeO[io2]]>0) {
              dmat[nodeO[io]][nodeO[io2]]*=-1; dmat[nodeO[io2]][nodeO[io]]*=-1;
              fill(gsub.begin(),gsub.end(),0);
              gsub[nodeO[io]]=1;gsub[nodeO[io2]]=1;
            myfile<<"sub test O "<<nodeO[io]+1<<"  "<<nodeO[io2]+1<<"  " <<-dmat[nodeO[io]][nodeO[io2]]<<endl;
            myfile<<"sub test H " ;
 //now get the hydrogens.
               if_share_h=false;
               for(int k=0;k<nodeH.size();k++) {
                     if(shareH(nodeO[io],nodeO[io2],nodeH[k])) if_share_h=true;
                     d1=dmat[nodeO[io]][nodeH[k]];
                     d2=dmat[nodeO[io2]][nodeH[k]];
                     if(d1<threldH||d2<threldH) { 
                       myfile<<" "<<nodeH[k]+1;
                       gsub[nodeH[k]]=1;
                     }
               }
                myfile<<endl<<std::boolalpha<<if_share_h<<endl<<endl<<std::noboolalpha;
               if(if_share_h==true) {
                  nsub++;
                  subsys.push_back(gsub);
               }
            }
         }
  }
  
        myfile<<"nsub "<<nsub<<endl<<endl;
        int a=subsys.size();
        int b=subsys[0].size();
        for(int i=0;i<b;i++)  {
          for(int j=0;j<a;j++) { 
             myfile<<"  "<<subsys[j][i]<<" ";
          }
          myfile<<endl;
        }

}
//----------------------------/
//----------------------------/



