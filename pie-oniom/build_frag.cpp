
#include <vector>
#include <string>
#include <bitset> //print binary numbers

#include "keywords.h"
#include "util.h"
#include "const.h"
#include "common.h"
#include <boost/multiprecision/cpp_int.hpp>  //big integer lib


using namespace std; 
using namespace boost::multiprecision;






//---------------------------/
int NextN(int N)  
// Next higher number with same number of 1-bits.
{  
    int x = N&(-N);        
    int t = N+x;  
    int ans = t | ((N^t)/x)>>2;  
    return ans;  
}  

//--------------------------/

cpp_int build_sub(int C,string &sgeom)  
{    
//    if(ifDebug) cout<<"debug in build_sub: sizeof isys "<<sizeof(cpp_int)*8<<"bits" <<endl;
    int k;  
    bool tmp[natm];
    int i;
    string slink; //geom for the link atoms.
    cpp_int isys,j;
    sgeom=""; //geom for ssubsystems
    isys =0; 
    
    for(int i=0;i<natm;i++) tmp[i]=1;

//calculate overlap 
    int m = 0;  
    while((k=1<<m)<=C)  
    {  
      if((C&k)!=0)  
      {  
        for(int i=0;i<natm;i++) tmp[i]=subsys[m][i]&&tmp[i];
      }  
      m++;  
    }  
    int iatm=0;  //counts number of atoms in the fragment.
    for( i=0, j=1;i<natm;i++,j*=2) {
        if(tmp[i]) {
              isys+=j;
              iatm+=1;
              sgeom+=atmname[i]+"  "+dtos(geom[i][0])+"  "+dtos(geom[i][1])+"  "+dtos(geom[i][2])+'\n';
        }
    }
    if(ifLink) {
      vector <vector<int> > tmpi1;
      vector<int>  tmpi2;
      vector<double>  tmpd;
      tmpi1.clear(); 
      tmpd.clear();
      string LAtom = "H  ";  // may move to common.h
      for(i=0;i<natm;i++) {
          if(tmp[i]) {
              for(int j=0;j<connect[i].size();j++) {  
                  int  ia=connect[i][j];
                  if(!tmp[ia]) { // hash-table is better. 
                    tmpi2.clear();
                    if((atmname[i]=="C" && atmname[ia]=="C") ||(atmname[i]=="6" && atmname[ia]=="6")) link_c2=lscale_cc;
                    if((atmname[i]=="N" && atmname[ia]=="C") ||(atmname[i]=="7" && atmname[ia]=="6")) link_c2=lscale_nc;
                    if((atmname[i]=="C" && atmname[ia]=="N") ||(atmname[i]=="6" && atmname[ia]=="7")) link_c2=lscale_cn;
                    tmpd.push_back(link_c2);
                    link_c1=1.0-link_c2;
                    slink+=  LAtom+   "  "+dtos(geom[i][0]*link_c1+geom[ia][0]*link_c2);                  //x
                    slink+=           "  "+dtos(geom[i][1]*link_c1+geom[ia][1]*link_c2);                  //y
                    slink+=           "  "+dtos(geom[i][2]*link_c1+geom[ia][2]*link_c2)+'\n';             //z
                    tmpi2.push_back(i); tmpi2.push_back(ia);  
                    tmpi1.push_back(tmpi2);
                  }
              }
          }
      }
      sgeom+=slink;
      link_atom.push_back(tmpi1);
      link_scale.push_back(tmpd);
    }


    if(iatm==1) {isys=0;sgeom="";} //if only one atom overlaped. no calculation. THIS HAPPENS IN H-WATER CLUSTER
    
    return isys;
}



//--------------------------/

void combination()  
{  cpp_int isys; 
// the whole system first
    string sgeom="";
    for(int i=0;i<natm;i++) {
        sgeom+=atmname[i]+"  "+dtos(geom[i][0])+"  "+dtos(geom[i][1])+"  "+dtos(geom[i][2])+'\n';
    }
    sub_subsys.push_back(sgeom); eflag.push_back(1);

// sub systems
  for(int i=1;i<=max_sub_overlap;i++) {
    int C = (1<<i)-1;    //C change to big int later in case more  than 64 fragments are needed.
    while(C<=((1<<nsub)-(1<<(nsub-i))))  
    { // if(ifDebug) cout<<"test in combination: C "<<(bitset<32>) C<<endl;  
       isys=build_sub(C,sgeom);  
       if(sgeom!=""){
          int ix;
          i%2==1?ix=1:ix=-1;
          int ifind=vec_find(mp,isys);
          if(ifind==-1){   //nothing is found.  no duplication.
             sub_subsys.push_back(sgeom);
             eflag.push_back(ix);
             mp.push_back(isys);
          }
          else {
           eflag[ifind+1]+=ix;   // 1st element is reserved for the whole system, so ifind+1
          }
       }

        C = NextN(C);  
    }       
  }
}      



