%mem=200MB
%chk=FHF.chk
%nproc=1
#p  b3lyp/6-31+g(d,p)
iop(2/29=1) force

title

1 1
O  0.0001160000  -0.0009610000  -0.3865650000
H  -0.8521630000  -0.5063640000  -0.1545080000
H  -0.0110030000  0.9905470000  -0.1569790000
H  0.8647230000  -0.4865790000  -0.1574000000
O  -0.0990710000  2.4985500000  0.1096410000
H  -0.1494960000  3.1505120000  -0.6032310000
H  0.1817010000  2.9597110000  0.9117540000


