V34 :0x24 parse_module
9 parse.f90 S624 0
01/19/2020  00:09:18
use data_module public 0 direct
use definitions_module public 0 indirect
use mpi public 0 indirect
use tea_module public 0 indirect
use report_module public 0 direct
use iso_fortran_env private
use iso_c_binding private
enduse
D 103 26 766 4272 763 7
D 253 22 7
D 255 22 7
D 257 22 7
D 259 22 7
D 261 22 7
D 263 22 7
D 265 22 7
D 267 22 7
D 269 22 7
D 271 22 7
D 273 22 7
D 275 22 7
D 277 22 7
D 279 22 7
D 281 22 7
D 283 22 7
D 285 22 7
D 287 22 7
D 289 22 7
D 291 22 7
D 293 22 7
D 295 22 7
D 297 22 7
D 299 22 7
D 304 26 939 5448 938 7
D 373 26 1022 8 1021 7
D 382 26 1025 8 1024 7
D 391 23 6 1 11 345 0 0 0 0 0
 0 345 11 11 345 345
D 394 23 6 1 11 345 0 0 0 0 0
 0 345 11 11 345 345
D 397 23 6 1 11 345 0 0 0 0 0
 0 345 11 11 345 345
D 400 23 6 1 11 345 0 0 0 0 0
 0 345 11 11 345 345
D 403 23 6 1 11 511 0 0 0 0 0
 0 511 11 11 511 511
D 406 23 6 1 11 511 0 0 0 0 0
 0 511 11 11 511 511
D 3244 20 51
D 3246 20 51
S 624 24 0 0 0 9 1 0 5015 10005 0 A 0 0 0 0 B 0 99 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 99 0 0 0 0 0 0 parse_module
S 631 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 633 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 637 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 500 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 684 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 690 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 694 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 763 25 69 definitions_module field_type
R 766 5 72 definitions_module density field_type
R 767 5 73 definitions_module density$sd field_type
R 768 5 74 definitions_module density$p field_type
R 769 5 75 definitions_module density$o field_type
R 773 5 79 definitions_module energy0 field_type
R 774 5 80 definitions_module energy0$sd field_type
R 775 5 81 definitions_module energy0$p field_type
R 776 5 82 definitions_module energy0$o field_type
R 778 5 84 definitions_module energy1 field_type
R 781 5 87 definitions_module energy1$sd field_type
R 782 5 88 definitions_module energy1$p field_type
R 783 5 89 definitions_module energy1$o field_type
R 787 5 93 definitions_module u field_type
R 788 5 94 definitions_module u$sd field_type
R 789 5 95 definitions_module u$p field_type
R 790 5 96 definitions_module u$o field_type
R 792 5 98 definitions_module u0 field_type
R 795 5 101 definitions_module u0$sd field_type
R 796 5 102 definitions_module u0$p field_type
R 797 5 103 definitions_module u0$o field_type
R 801 5 107 definitions_module vector_p field_type
R 802 5 108 definitions_module vector_p$sd field_type
R 803 5 109 definitions_module vector_p$p field_type
R 804 5 110 definitions_module vector_p$o field_type
R 808 5 114 definitions_module vector_r field_type
R 809 5 115 definitions_module vector_r$sd field_type
R 810 5 116 definitions_module vector_r$p field_type
R 811 5 117 definitions_module vector_r$o field_type
R 815 5 121 definitions_module vector_mi field_type
R 816 5 122 definitions_module vector_mi$sd field_type
R 817 5 123 definitions_module vector_mi$p field_type
R 818 5 124 definitions_module vector_mi$o field_type
R 822 5 128 definitions_module vector_w field_type
R 823 5 129 definitions_module vector_w$sd field_type
R 824 5 130 definitions_module vector_w$p field_type
R 825 5 131 definitions_module vector_w$o field_type
R 829 5 135 definitions_module vector_z field_type
R 830 5 136 definitions_module vector_z$sd field_type
R 831 5 137 definitions_module vector_z$p field_type
R 832 5 138 definitions_module vector_z$o field_type
R 836 5 142 definitions_module vector_kx field_type
R 837 5 143 definitions_module vector_kx$sd field_type
R 838 5 144 definitions_module vector_kx$p field_type
R 839 5 145 definitions_module vector_kx$o field_type
R 843 5 149 definitions_module vector_ky field_type
R 844 5 150 definitions_module vector_ky$sd field_type
R 845 5 151 definitions_module vector_ky$p field_type
R 846 5 152 definitions_module vector_ky$o field_type
R 850 5 156 definitions_module vector_sd field_type
R 851 5 157 definitions_module vector_sd$sd field_type
R 852 5 158 definitions_module vector_sd$p field_type
R 853 5 159 definitions_module vector_sd$o field_type
R 855 5 161 definitions_module left field_type
R 856 5 162 definitions_module right field_type
R 857 5 163 definitions_module bottom field_type
R 858 5 164 definitions_module top field_type
R 859 5 165 definitions_module left_boundary field_type
R 860 5 166 definitions_module right_boundary field_type
R 861 5 167 definitions_module bottom_boundary field_type
R 862 5 168 definitions_module top_boundary field_type
R 863 5 169 definitions_module x_min field_type
R 864 5 170 definitions_module y_min field_type
R 865 5 171 definitions_module x_max field_type
R 866 5 172 definitions_module y_max field_type
R 868 5 174 definitions_module cellx field_type
R 869 5 175 definitions_module cellx$sd field_type
R 870 5 176 definitions_module cellx$p field_type
R 871 5 177 definitions_module cellx$o field_type
R 873 5 179 definitions_module celly field_type
R 875 5 181 definitions_module celly$sd field_type
R 876 5 182 definitions_module celly$p field_type
R 877 5 183 definitions_module celly$o field_type
R 879 5 185 definitions_module vertexx field_type
R 881 5 187 definitions_module vertexx$sd field_type
R 882 5 188 definitions_module vertexx$p field_type
R 883 5 189 definitions_module vertexx$o field_type
R 885 5 191 definitions_module vertexy field_type
R 887 5 193 definitions_module vertexy$sd field_type
R 888 5 194 definitions_module vertexy$p field_type
R 889 5 195 definitions_module vertexy$o field_type
R 891 5 197 definitions_module celldx field_type
R 893 5 199 definitions_module celldx$sd field_type
R 894 5 200 definitions_module celldx$p field_type
R 895 5 201 definitions_module celldx$o field_type
R 897 5 203 definitions_module celldy field_type
R 899 5 205 definitions_module celldy$sd field_type
R 900 5 206 definitions_module celldy$p field_type
R 901 5 207 definitions_module celldy$o field_type
R 903 5 209 definitions_module vertexdx field_type
R 905 5 211 definitions_module vertexdx$sd field_type
R 906 5 212 definitions_module vertexdx$p field_type
R 907 5 213 definitions_module vertexdx$o field_type
R 909 5 215 definitions_module vertexdy field_type
R 911 5 217 definitions_module vertexdy$sd field_type
R 912 5 218 definitions_module vertexdy$p field_type
R 913 5 219 definitions_module vertexdy$o field_type
R 917 5 223 definitions_module volume field_type
R 918 5 224 definitions_module volume$sd field_type
R 919 5 225 definitions_module volume$p field_type
R 920 5 226 definitions_module volume$o field_type
R 922 5 228 definitions_module xarea field_type
R 925 5 231 definitions_module xarea$sd field_type
R 926 5 232 definitions_module xarea$p field_type
R 927 5 233 definitions_module xarea$o field_type
R 929 5 235 definitions_module yarea field_type
R 932 5 238 definitions_module yarea$sd field_type
R 933 5 239 definitions_module yarea$p field_type
R 934 5 240 definitions_module yarea$o field_type
R 938 25 244 definitions_module chunk_type
R 939 5 245 definitions_module task chunk_type
R 940 5 246 definitions_module chunk_neighbours chunk_type
R 941 5 247 definitions_module left_rcv_buffer chunk_type
R 943 5 249 definitions_module left_rcv_buffer$sd chunk_type
R 944 5 250 definitions_module left_rcv_buffer$p chunk_type
R 945 5 251 definitions_module left_rcv_buffer$o chunk_type
R 947 5 253 definitions_module right_rcv_buffer chunk_type
R 949 5 255 definitions_module right_rcv_buffer$sd chunk_type
R 950 5 256 definitions_module right_rcv_buffer$p chunk_type
R 951 5 257 definitions_module right_rcv_buffer$o chunk_type
R 953 5 259 definitions_module bottom_rcv_buffer chunk_type
R 955 5 261 definitions_module bottom_rcv_buffer$sd chunk_type
R 956 5 262 definitions_module bottom_rcv_buffer$p chunk_type
R 957 5 263 definitions_module bottom_rcv_buffer$o chunk_type
R 959 5 265 definitions_module top_rcv_buffer chunk_type
R 961 5 267 definitions_module top_rcv_buffer$sd chunk_type
R 962 5 268 definitions_module top_rcv_buffer$p chunk_type
R 963 5 269 definitions_module top_rcv_buffer$o chunk_type
R 965 5 271 definitions_module left_snd_buffer chunk_type
R 967 5 273 definitions_module left_snd_buffer$sd chunk_type
R 968 5 274 definitions_module left_snd_buffer$p chunk_type
R 969 5 275 definitions_module left_snd_buffer$o chunk_type
R 971 5 277 definitions_module right_snd_buffer chunk_type
R 973 5 279 definitions_module right_snd_buffer$sd chunk_type
R 974 5 280 definitions_module right_snd_buffer$p chunk_type
R 975 5 281 definitions_module right_snd_buffer$o chunk_type
R 977 5 283 definitions_module bottom_snd_buffer chunk_type
R 979 5 285 definitions_module bottom_snd_buffer$sd chunk_type
R 980 5 286 definitions_module bottom_snd_buffer$p chunk_type
R 981 5 287 definitions_module bottom_snd_buffer$o chunk_type
R 983 5 289 definitions_module top_snd_buffer chunk_type
R 985 5 291 definitions_module top_snd_buffer$sd chunk_type
R 986 5 292 definitions_module top_snd_buffer$p chunk_type
R 987 5 293 definitions_module top_snd_buffer$o chunk_type
R 989 5 295 definitions_module field chunk_type
S 1007 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
R 1021 25 6 iso_c_binding c_ptr
R 1022 5 7 iso_c_binding val c_ptr
R 1024 25 9 iso_c_binding c_funptr
R 1025 5 10 iso_c_binding val c_funptr
R 1059 6 44 iso_c_binding c_null_ptr$ac
R 1061 6 46 iso_c_binding c_null_funptr$ac
R 1062 26 47 iso_c_binding ==
R 1064 26 49 iso_c_binding !=
S 1093 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 1115 7 22 iso_fortran_env integer_kinds$ac
R 1117 7 24 iso_fortran_env logical_kinds$ac
R 1119 7 26 iso_fortran_env real_kinds$ac
S 8512 16 1 0 0 6 1 624 41623 4 400000 A 0 0 0 0 B 0 106 0 0 0 0 0 0 500 51 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 len_max
S 8513 16 0 0 0 6 1 624 41631 4 400000 A 0 0 0 0 B 0 106 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 dummy
S 8514 6 4 0 0 6 1 624 41637 4 0 A 0 0 0 0 B 0 109 0 0 0 0 0 0 0 0 0 0 8520 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 iu
S 8515 6 4 0 0 3244 8516 624 3938 4 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 8521 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 mask
S 8516 6 4 0 0 3244 8517 624 41640 4 0 A 0 0 0 0 B 0 111 0 0 0 500 0 0 0 0 0 0 8521 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 line
S 8517 6 4 0 0 3244 8518 624 41645 4 0 A 0 0 0 0 B 0 111 0 0 0 1000 0 0 0 0 0 0 8521 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 here
S 8518 6 4 0 0 3244 8519 624 41650 4 0 A 0 0 0 0 B 0 111 0 0 0 1500 0 0 0 0 0 0 8521 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 sel
S 8519 6 4 0 0 3244 1 624 41654 4 0 A 0 0 0 0 B 0 111 0 0 0 2000 0 0 0 0 0 0 8521 0 0 0 0 0 0 0 0 0 0 624 0 0 0 0 rest
S 8520 11 0 0 0 9 1518 624 41659 40800000 805000 A 0 0 0 0 B 0 116 0 0 0 4 0 0 8514 8514 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 _parse_module$0
S 8521 11 0 0 0 9 8520 624 41675 40800000 805000 A 0 0 0 0 B 0 116 0 0 0 2500 0 0 8515 8519 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 _parse_module$1
S 8522 23 5 0 0 9 8525 624 41691 0 0 A 0 0 0 0 B 0 141 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_init
S 8523 1 3 0 0 6 1 8522 41702 4 3000 A 0 0 0 0 B 0 141 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 iunit
S 8524 1 3 0 0 30 1 8522 41708 4 43000 A 0 0 0 0 B 0 141 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cmask
S 8525 14 5 0 0 6 1 8522 41691 4 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 5360 2 0 0 8526 0 0 0 0 0 0 0 0 0 118 0 624 0 0 0 0 parse_init
F 8525 2 8523 8524
S 8526 1 3 0 0 6 1 8522 41691 4 1003000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_init
S 8527 23 5 0 0 9 8529 624 41714 0 0 A 0 0 0 0 B 0 247 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_getline
S 8528 1 3 1 0 6 1 8527 41631 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 dummy
S 8529 14 5 0 0 6 1 8527 41714 4 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 5363 1 0 0 8530 0 0 0 0 0 0 0 0 0 143 0 624 0 0 0 0 parse_getline
F 8529 1 8528
S 8530 1 3 0 0 6 1 8527 41714 4 1003000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_getline
S 8531 23 5 0 0 9 8534 624 41728 20000 0 A 0 0 0 0 B 0 277 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_getword
S 8532 1 3 0 0 18 1 8531 41742 4 3000 A 0 0 0 0 B 0 277 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 wrap
S 8533 1 3 0 0 3246 1 8531 41747 4 1003000 A 0 0 0 0 B 0 277 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 getword
S 8534 14 5 0 0 3246 1 8531 41728 20004 1400000 A 0 0 0 0 B 0 0 0 0 0 0 0 5365 1 0 0 8533 0 0 0 0 0 0 0 0 0 249 0 624 0 0 0 0 parse_getword
F 8534 1 8532
S 8535 23 5 0 0 9 8537 624 41755 0 0 A 0 0 0 0 B 0 297 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_getival
S 8536 1 3 0 0 30 1 8535 41769 4 43000 A 0 0 0 0 B 0 297 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 word
S 8537 14 5 0 0 6 1 8535 41755 4 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 5367 1 0 0 8538 0 0 0 0 0 0 0 0 0 279 0 624 0 0 0 0 parse_getival
F 8537 1 8536
S 8538 1 3 0 0 6 1 8535 41755 4 1003000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_getival
S 8539 23 5 0 0 9 8541 624 41774 0 0 A 0 0 0 0 B 0 330 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_getlval
S 8540 1 3 0 0 30 1 8539 41769 4 43000 A 0 0 0 0 B 0 330 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 word
S 8541 14 5 0 0 18 1 8539 41774 4 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 5369 1 0 0 8542 0 0 0 0 0 0 0 0 0 299 0 624 0 0 0 0 parse_getlval
F 8541 1 8540
S 8542 1 3 0 0 18 1 8539 41774 4 1003000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_getlval
S 8543 23 5 0 0 9 8545 624 41788 0 0 A 0 0 0 0 B 0 354 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_getrval
S 8544 1 3 0 0 30 1 8543 41769 4 43000 A 0 0 0 0 B 0 354 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 word
S 8545 14 5 0 0 10 1 8543 41788 4 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 5371 1 0 0 8546 0 0 0 0 0 0 0 0 0 332 0 624 0 0 0 0 parse_getrval
F 8545 1 8544
S 8546 1 3 0 0 10 1 8543 41788 4 1003000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_getrval
S 8547 23 5 0 0 9 8550 624 41802 0 0 A 0 0 0 0 B 0 379 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_scan
S 8548 1 3 1 0 30 1 8547 16148 4 43000 A 0 0 0 0 B 0 379 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 string
S 8549 1 3 1 0 30 1 8547 41813 4 43000 A 0 0 0 0 B 0 379 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 set
S 8550 14 5 0 0 6 1 8547 41802 4 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 5373 2 0 0 8551 0 0 0 0 0 0 0 0 0 356 0 624 0 0 0 0 parse_scan
F 8550 2 8548 8549
S 8551 1 3 0 0 6 1 8547 41802 4 1003000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 parse_scan
A 24 2 0 0 0 6 631 0 0 0 24 0 0 0 0 0 0 0 0 0 0 0
A 30 2 0 0 0 6 633 0 0 0 30 0 0 0 0 0 0 0 0 0 0 0
A 51 2 0 0 0 6 637 0 0 0 51 0 0 0 0 0 0 0 0 0 0 0
A 55 2 0 0 0 7 684 0 0 0 55 0 0 0 0 0 0 0 0 0 0 0
A 69 2 0 0 0 7 690 0 0 0 69 0 0 0 0 0 0 0 0 0 0 0
A 345 2 0 0 0 7 694 0 0 0 345 0 0 0 0 0 0 0 0 0 0 0
A 421 2 0 0 274 6 1007 0 0 0 421 0 0 0 0 0 0 0 0 0 0 0
A 471 1 0 0 0 373 1059 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 474 1 0 0 195 382 1061 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 511 2 0 0 0 7 1093 0 0 0 511 0 0 0 0 0 0 0 0 0 0 0
A 517 1 0 5 0 391 1115 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 523 1 0 5 289 397 1117 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 527 1 0 7 50 403 1119 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Z
J 131 1 1
V 471 373 7 0
S 0 373 0 0 0
A 0 6 0 0 1 2 0
J 132 1 1
V 474 382 7 0
S 0 382 0 0 0
A 0 6 0 0 1 2 0
J 69 1 1
V 517 391 7 0
R 0 394 0 0
A 0 6 0 0 1 3 1
A 0 6 0 0 1 24 1
A 0 6 0 0 1 30 1
A 0 6 0 0 1 421 0
J 71 1 1
V 523 397 7 0
R 0 400 0 0
A 0 6 0 0 1 3 1
A 0 6 0 0 1 24 1
A 0 6 0 0 1 30 1
A 0 6 0 0 1 421 0
J 73 1 1
V 527 403 7 0
R 0 406 0 0
A 0 6 0 0 1 30 1
A 0 6 0 0 1 421 0
T 763 103 0 0 0 0
A 768 7 253 0 1 2 1
A 767 7 0 69 1 10 1
A 775 7 255 0 1 2 1
A 774 7 0 69 1 10 1
A 782 7 257 0 1 2 1
A 781 7 0 69 1 10 1
A 789 7 259 0 1 2 1
A 788 7 0 69 1 10 1
A 796 7 261 0 1 2 1
A 795 7 0 69 1 10 1
A 803 7 263 0 1 2 1
A 802 7 0 69 1 10 1
A 810 7 265 0 1 2 1
A 809 7 0 69 1 10 1
A 817 7 267 0 1 2 1
A 816 7 0 69 1 10 1
A 824 7 269 0 1 2 1
A 823 7 0 69 1 10 1
A 831 7 271 0 1 2 1
A 830 7 0 69 1 10 1
A 838 7 273 0 1 2 1
A 837 7 0 69 1 10 1
A 845 7 275 0 1 2 1
A 844 7 0 69 1 10 1
A 852 7 277 0 1 2 1
A 851 7 0 69 1 10 1
A 870 7 279 0 1 2 1
A 869 7 0 55 1 10 1
A 876 7 281 0 1 2 1
A 875 7 0 55 1 10 1
A 882 7 283 0 1 2 1
A 881 7 0 55 1 10 1
A 888 7 285 0 1 2 1
A 887 7 0 55 1 10 1
A 894 7 287 0 1 2 1
A 893 7 0 55 1 10 1
A 900 7 289 0 1 2 1
A 899 7 0 55 1 10 1
A 906 7 291 0 1 2 1
A 905 7 0 55 1 10 1
A 912 7 293 0 1 2 1
A 911 7 0 55 1 10 1
A 919 7 295 0 1 2 1
A 918 7 0 69 1 10 1
A 926 7 297 0 1 2 1
A 925 7 0 69 1 10 1
A 933 7 299 0 1 2 1
A 932 7 0 69 1 10 0
T 938 304 0 3 0 0
T 989 103 0 3 0 0
A 768 7 253 0 1 2 1
A 767 7 0 69 1 10 1
A 775 7 255 0 1 2 1
A 774 7 0 69 1 10 1
A 782 7 257 0 1 2 1
A 781 7 0 69 1 10 1
A 789 7 259 0 1 2 1
A 788 7 0 69 1 10 1
A 796 7 261 0 1 2 1
A 795 7 0 69 1 10 1
A 803 7 263 0 1 2 1
A 802 7 0 69 1 10 1
A 810 7 265 0 1 2 1
A 809 7 0 69 1 10 1
A 817 7 267 0 1 2 1
A 816 7 0 69 1 10 1
A 824 7 269 0 1 2 1
A 823 7 0 69 1 10 1
A 831 7 271 0 1 2 1
A 830 7 0 69 1 10 1
A 838 7 273 0 1 2 1
A 837 7 0 69 1 10 1
A 845 7 275 0 1 2 1
A 844 7 0 69 1 10 1
A 852 7 277 0 1 2 1
A 851 7 0 69 1 10 1
A 870 7 279 0 1 2 1
A 869 7 0 55 1 10 1
A 876 7 281 0 1 2 1
A 875 7 0 55 1 10 1
A 882 7 283 0 1 2 1
A 881 7 0 55 1 10 1
A 888 7 285 0 1 2 1
A 887 7 0 55 1 10 1
A 894 7 287 0 1 2 1
A 893 7 0 55 1 10 1
A 900 7 289 0 1 2 1
A 899 7 0 55 1 10 1
A 906 7 291 0 1 2 1
A 905 7 0 55 1 10 1
A 912 7 293 0 1 2 1
A 911 7 0 55 1 10 1
A 919 7 295 0 1 2 1
A 918 7 0 69 1 10 1
A 926 7 297 0 1 2 1
A 925 7 0 69 1 10 1
A 933 7 299 0 1 2 1
A 932 7 0 69 1 10 0
Z
