V34 :0x24 tea_leaf_module
13 tea_solve.f90 S624 0
01/19/2020  22:17:58
use definitions_module public 0 indirect
use mpi public 0 indirect
use tea_module public 0 indirect
use report_module public 0 direct
use data_module public 0 direct
use tea_leaf_kernel_cg_module public 0 direct
use tea_leaf_kernel_module public 0 direct
use tea_leaf_kernel_ppcg_module public 0 direct
use tea_leaf_kernel_cheby_module public 0 direct
use update_halo_module public 0 direct
use iso_fortran_env private
use iso_c_binding private
enduse
D 103 26 771 4272 768 7
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
D 304 26 944 5448 943 7
D 373 26 1027 8 1026 7
D 382 26 1030 8 1029 7
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
D 3523 23 10 1 11 2168 0 0 1 0 0
 0 2167 11 11 2168 2168
D 3526 23 10 1 11 2168 0 0 1 0 0
 0 2167 11 11 2168 2168
D 3529 23 6 1 2169 2172 1 1 0 0 1
 11 2170 11 11 2170 2171
D 3532 23 10 1 2173 2176 1 1 0 0 1
 11 2174 11 11 2174 2175
D 3535 23 10 1 2177 2180 1 1 0 0 1
 11 2178 11 11 2178 2179
S 624 24 0 0 0 9 1 0 5015 10005 0 A 0 0 0 0 B 0 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 22 0 0 0 0 0 0 tea_leaf_module
S 636 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 638 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
S 689 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 695 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 22 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
S 699 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 737 6 38 definitions_module max_iters
R 768 25 69 definitions_module field_type
R 771 5 72 definitions_module density field_type
R 772 5 73 definitions_module density$sd field_type
R 773 5 74 definitions_module density$p field_type
R 774 5 75 definitions_module density$o field_type
R 778 5 79 definitions_module energy0 field_type
R 779 5 80 definitions_module energy0$sd field_type
R 780 5 81 definitions_module energy0$p field_type
R 781 5 82 definitions_module energy0$o field_type
R 783 5 84 definitions_module energy1 field_type
R 786 5 87 definitions_module energy1$sd field_type
R 787 5 88 definitions_module energy1$p field_type
R 788 5 89 definitions_module energy1$o field_type
R 792 5 93 definitions_module u field_type
R 793 5 94 definitions_module u$sd field_type
R 794 5 95 definitions_module u$p field_type
R 795 5 96 definitions_module u$o field_type
R 797 5 98 definitions_module u0 field_type
R 800 5 101 definitions_module u0$sd field_type
R 801 5 102 definitions_module u0$p field_type
R 802 5 103 definitions_module u0$o field_type
R 806 5 107 definitions_module vector_p field_type
R 807 5 108 definitions_module vector_p$sd field_type
R 808 5 109 definitions_module vector_p$p field_type
R 809 5 110 definitions_module vector_p$o field_type
R 813 5 114 definitions_module vector_r field_type
R 814 5 115 definitions_module vector_r$sd field_type
R 815 5 116 definitions_module vector_r$p field_type
R 816 5 117 definitions_module vector_r$o field_type
R 820 5 121 definitions_module vector_mi field_type
R 821 5 122 definitions_module vector_mi$sd field_type
R 822 5 123 definitions_module vector_mi$p field_type
R 823 5 124 definitions_module vector_mi$o field_type
R 827 5 128 definitions_module vector_w field_type
R 828 5 129 definitions_module vector_w$sd field_type
R 829 5 130 definitions_module vector_w$p field_type
R 830 5 131 definitions_module vector_w$o field_type
R 834 5 135 definitions_module vector_z field_type
R 835 5 136 definitions_module vector_z$sd field_type
R 836 5 137 definitions_module vector_z$p field_type
R 837 5 138 definitions_module vector_z$o field_type
R 841 5 142 definitions_module vector_kx field_type
R 842 5 143 definitions_module vector_kx$sd field_type
R 843 5 144 definitions_module vector_kx$p field_type
R 844 5 145 definitions_module vector_kx$o field_type
R 848 5 149 definitions_module vector_ky field_type
R 849 5 150 definitions_module vector_ky$sd field_type
R 850 5 151 definitions_module vector_ky$p field_type
R 851 5 152 definitions_module vector_ky$o field_type
R 855 5 156 definitions_module vector_sd field_type
R 856 5 157 definitions_module vector_sd$sd field_type
R 857 5 158 definitions_module vector_sd$p field_type
R 858 5 159 definitions_module vector_sd$o field_type
R 860 5 161 definitions_module left field_type
R 861 5 162 definitions_module right field_type
R 862 5 163 definitions_module bottom field_type
R 863 5 164 definitions_module top field_type
R 864 5 165 definitions_module left_boundary field_type
R 865 5 166 definitions_module right_boundary field_type
R 866 5 167 definitions_module bottom_boundary field_type
R 867 5 168 definitions_module top_boundary field_type
R 868 5 169 definitions_module x_min field_type
R 869 5 170 definitions_module y_min field_type
R 870 5 171 definitions_module x_max field_type
R 871 5 172 definitions_module y_max field_type
R 873 5 174 definitions_module cellx field_type
R 874 5 175 definitions_module cellx$sd field_type
R 875 5 176 definitions_module cellx$p field_type
R 876 5 177 definitions_module cellx$o field_type
R 878 5 179 definitions_module celly field_type
R 880 5 181 definitions_module celly$sd field_type
R 881 5 182 definitions_module celly$p field_type
R 882 5 183 definitions_module celly$o field_type
R 884 5 185 definitions_module vertexx field_type
R 886 5 187 definitions_module vertexx$sd field_type
R 887 5 188 definitions_module vertexx$p field_type
R 888 5 189 definitions_module vertexx$o field_type
R 890 5 191 definitions_module vertexy field_type
R 892 5 193 definitions_module vertexy$sd field_type
R 893 5 194 definitions_module vertexy$p field_type
R 894 5 195 definitions_module vertexy$o field_type
R 896 5 197 definitions_module celldx field_type
R 898 5 199 definitions_module celldx$sd field_type
R 899 5 200 definitions_module celldx$p field_type
R 900 5 201 definitions_module celldx$o field_type
R 902 5 203 definitions_module celldy field_type
R 904 5 205 definitions_module celldy$sd field_type
R 905 5 206 definitions_module celldy$p field_type
R 906 5 207 definitions_module celldy$o field_type
R 908 5 209 definitions_module vertexdx field_type
R 910 5 211 definitions_module vertexdx$sd field_type
R 911 5 212 definitions_module vertexdx$p field_type
R 912 5 213 definitions_module vertexdx$o field_type
R 914 5 215 definitions_module vertexdy field_type
R 916 5 217 definitions_module vertexdy$sd field_type
R 917 5 218 definitions_module vertexdy$p field_type
R 918 5 219 definitions_module vertexdy$o field_type
R 922 5 223 definitions_module volume field_type
R 923 5 224 definitions_module volume$sd field_type
R 924 5 225 definitions_module volume$p field_type
R 925 5 226 definitions_module volume$o field_type
R 927 5 228 definitions_module xarea field_type
R 930 5 231 definitions_module xarea$sd field_type
R 931 5 232 definitions_module xarea$p field_type
R 932 5 233 definitions_module xarea$o field_type
R 934 5 235 definitions_module yarea field_type
R 937 5 238 definitions_module yarea$sd field_type
R 938 5 239 definitions_module yarea$p field_type
R 939 5 240 definitions_module yarea$o field_type
R 943 25 244 definitions_module chunk_type
R 944 5 245 definitions_module task chunk_type
R 945 5 246 definitions_module chunk_neighbours chunk_type
R 946 5 247 definitions_module left_rcv_buffer chunk_type
R 948 5 249 definitions_module left_rcv_buffer$sd chunk_type
R 949 5 250 definitions_module left_rcv_buffer$p chunk_type
R 950 5 251 definitions_module left_rcv_buffer$o chunk_type
R 952 5 253 definitions_module right_rcv_buffer chunk_type
R 954 5 255 definitions_module right_rcv_buffer$sd chunk_type
R 955 5 256 definitions_module right_rcv_buffer$p chunk_type
R 956 5 257 definitions_module right_rcv_buffer$o chunk_type
R 958 5 259 definitions_module bottom_rcv_buffer chunk_type
R 960 5 261 definitions_module bottom_rcv_buffer$sd chunk_type
R 961 5 262 definitions_module bottom_rcv_buffer$p chunk_type
R 962 5 263 definitions_module bottom_rcv_buffer$o chunk_type
R 964 5 265 definitions_module top_rcv_buffer chunk_type
R 966 5 267 definitions_module top_rcv_buffer$sd chunk_type
R 967 5 268 definitions_module top_rcv_buffer$p chunk_type
R 968 5 269 definitions_module top_rcv_buffer$o chunk_type
R 970 5 271 definitions_module left_snd_buffer chunk_type
R 972 5 273 definitions_module left_snd_buffer$sd chunk_type
R 973 5 274 definitions_module left_snd_buffer$p chunk_type
R 974 5 275 definitions_module left_snd_buffer$o chunk_type
R 976 5 277 definitions_module right_snd_buffer chunk_type
R 978 5 279 definitions_module right_snd_buffer$sd chunk_type
R 979 5 280 definitions_module right_snd_buffer$p chunk_type
R 980 5 281 definitions_module right_snd_buffer$o chunk_type
R 982 5 283 definitions_module bottom_snd_buffer chunk_type
R 984 5 285 definitions_module bottom_snd_buffer$sd chunk_type
R 985 5 286 definitions_module bottom_snd_buffer$p chunk_type
R 986 5 287 definitions_module bottom_snd_buffer$o chunk_type
R 988 5 289 definitions_module top_snd_buffer chunk_type
R 990 5 291 definitions_module top_snd_buffer$sd chunk_type
R 991 5 292 definitions_module top_snd_buffer$p chunk_type
R 992 5 293 definitions_module top_snd_buffer$o chunk_type
R 994 5 295 definitions_module field chunk_type
S 1012 3 0 0 0 6 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6
R 1026 25 6 iso_c_binding c_ptr
R 1027 5 7 iso_c_binding val c_ptr
R 1029 25 9 iso_c_binding c_funptr
R 1030 5 10 iso_c_binding val c_funptr
R 1064 6 44 iso_c_binding c_null_ptr$ac
R 1066 6 46 iso_c_binding c_null_funptr$ac
R 1067 26 47 iso_c_binding ==
R 1069 26 49 iso_c_binding !=
S 1098 3 0 0 0 7 1 1 0 0 0 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7
R 1120 7 22 iso_fortran_env integer_kinds$ac
R 1122 7 24 iso_fortran_env logical_kinds$ac
R 1124 7 26 iso_fortran_env real_kinds$ac
S 8898 23 5 0 0 0 8899 624 43103 0 0 A 0 0 0 0 B 0 551 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 tea_leaf
S 8899 14 5 0 0 0 1 8898 43103 0 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 5585 0 0 0 0 0 0 0 0 0 0 0 0 0 36 0 624 0 0 0 0 tea_leaf
F 8899 0
S 8900 23 5 0 0 0 8908 624 43112 0 0 A 0 0 0 0 B 0 596 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 tea_leaf_run_ppcg_inner_steps
S 8901 7 3 0 0 3523 1 8900 42515 800204 3000 A 0 0 0 0 B 0 596 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ch_alphas
S 8902 7 3 0 0 3526 1 8900 42525 800204 3000 A 0 0 0 0 B 0 596 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ch_betas
S 8903 1 3 0 0 10 1 8900 42550 4 3000 A 0 0 0 0 B 0 596 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 theta
S 8904 1 3 0 0 10 1 8900 41895 4 3000 A 0 0 0 0 B 0 596 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 rx
S 8905 1 3 0 0 10 1 8900 41898 4 3000 A 0 0 0 0 B 0 596 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ry
S 8906 1 3 0 0 6 1 8900 43142 4 3000 A 0 0 0 0 B 0 596 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 c
S 8907 1 3 0 0 6 1 8900 6164 4 3000 A 0 0 0 0 B 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 tl_ppcg_inner_steps
S 8908 14 5 0 0 0 1 8900 43112 200 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 5586 7 0 0 0 0 0 0 0 0 0 0 0 0 553 0 624 0 0 0 0 tea_leaf_run_ppcg_inner_steps
F 8908 7 8901 8902 8903 8904 8905 8907 8906
S 8909 6 1 0 0 7 1 8900 43144 40800006 3000 A 0 0 0 0 B 0 596 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_2167
S 8910 23 5 0 0 0 8922 624 43153 0 0 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 tea_leaf_cheby_first_step
S 8911 1 3 0 0 6 1 8910 43142 4 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 c
S 8912 7 3 0 0 3532 1 8910 42515 20000004 10003000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ch_alphas
S 8913 7 3 0 0 3535 1 8910 42525 20000004 10003000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ch_betas
S 8914 7 3 0 0 3529 1 8910 41069 20000004 10003000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 fields
S 8915 1 3 0 0 10 1 8910 41732 4 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 error
S 8916 1 3 0 0 10 1 8910 41895 4 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 rx
S 8917 1 3 0 0 10 1 8910 41898 4 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ry
S 8918 1 3 0 0 10 1 8910 42550 4 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 theta
S 8919 1 3 0 0 10 1 8910 43179 4 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cn
S 8920 1 3 0 0 6 1 8910 42534 4 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 max_cheby_iters
S 8921 1 3 0 0 6 1 8910 43182 4 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 est_itc
S 8922 14 5 0 0 0 1 8910 43153 20000000 400000 A 0 0 0 0 B 0 0 0 0 0 0 0 5594 11 0 0 0 0 0 0 0 0 0 0 0 0 598 0 624 0 0 0 0 tea_leaf_cheby_first_step
F 8922 11 8911 8912 8913 8914 8915 8916 8917 8918 8919 8920 8921
S 8923 6 1 0 0 7 1 8910 40892 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_1_1
S 8924 6 1 0 0 7 1 8910 40900 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_2_1
S 8925 6 1 0 0 7 1 8910 40908 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_3_1
S 8926 6 1 0 0 7 1 8910 43190 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_2174
S 8927 6 1 0 0 7 1 8910 40925 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_5_1
S 8928 6 1 0 0 7 1 8910 40933 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_6_1
S 8929 6 1 0 0 7 1 8910 40941 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_7_1
S 8930 6 1 0 0 7 1 8910 43199 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_2181
S 8931 6 1 0 0 7 1 8910 40958 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_9_1
S 8932 6 1 0 0 7 1 8910 40966 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_10_1
S 8933 6 1 0 0 7 1 8910 40975 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_b_11_1
S 8934 6 1 0 0 7 1 8910 43208 40800006 3000 A 0 0 0 0 B 0 681 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 z_e_2188
A 24 2 0 0 0 6 636 0 0 0 24 0 0 0 0 0 0 0 0 0 0 0
A 30 2 0 0 0 6 638 0 0 0 30 0 0 0 0 0 0 0 0 0 0 0
A 55 2 0 0 0 7 689 0 0 0 55 0 0 0 0 0 0 0 0 0 0 0
A 69 2 0 0 0 7 695 0 0 0 69 0 0 0 0 0 0 0 0 0 0 0
A 345 2 0 0 318 7 699 0 0 0 345 0 0 0 0 0 0 0 0 0 0 0
A 421 2 0 0 274 6 1012 0 0 0 421 0 0 0 0 0 0 0 0 0 0 0
A 471 1 0 0 287 373 1064 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 474 1 0 0 0 382 1066 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 511 2 0 0 0 7 1098 0 0 0 511 0 0 0 0 0 0 0 0 0 0 0
A 517 1 0 5 0 391 1120 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 523 1 0 5 130 397 1122 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 527 1 0 7 189 403 1124 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2166 1 0 0 2078 6 737 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2167 7 0 0 1763 7 2166 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2168 1 0 0 1642 7 8909 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2169 1 0 0 1791 7 8925 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2170 1 0 0 1792 7 8923 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2171 1 0 0 774 7 8926 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2172 1 0 0 1942 7 8924 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2173 1 0 0 1646 7 8929 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2174 1 0 0 1945 7 8927 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2175 1 0 0 1403 7 8930 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2176 1 0 0 1263 7 8928 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2177 1 0 0 1951 7 8933 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2178 1 0 0 1404 7 8931 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2179 1 0 0 1796 7 8934 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
A 2180 1 0 0 1558 7 8932 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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
T 768 103 0 0 0 0
A 773 7 253 0 1 2 1
A 772 7 0 69 1 10 1
A 780 7 255 0 1 2 1
A 779 7 0 69 1 10 1
A 787 7 257 0 1 2 1
A 786 7 0 69 1 10 1
A 794 7 259 0 1 2 1
A 793 7 0 69 1 10 1
A 801 7 261 0 1 2 1
A 800 7 0 69 1 10 1
A 808 7 263 0 1 2 1
A 807 7 0 69 1 10 1
A 815 7 265 0 1 2 1
A 814 7 0 69 1 10 1
A 822 7 267 0 1 2 1
A 821 7 0 69 1 10 1
A 829 7 269 0 1 2 1
A 828 7 0 69 1 10 1
A 836 7 271 0 1 2 1
A 835 7 0 69 1 10 1
A 843 7 273 0 1 2 1
A 842 7 0 69 1 10 1
A 850 7 275 0 1 2 1
A 849 7 0 69 1 10 1
A 857 7 277 0 1 2 1
A 856 7 0 69 1 10 1
A 875 7 279 0 1 2 1
A 874 7 0 55 1 10 1
A 881 7 281 0 1 2 1
A 880 7 0 55 1 10 1
A 887 7 283 0 1 2 1
A 886 7 0 55 1 10 1
A 893 7 285 0 1 2 1
A 892 7 0 55 1 10 1
A 899 7 287 0 1 2 1
A 898 7 0 55 1 10 1
A 905 7 289 0 1 2 1
A 904 7 0 55 1 10 1
A 911 7 291 0 1 2 1
A 910 7 0 55 1 10 1
A 917 7 293 0 1 2 1
A 916 7 0 55 1 10 1
A 924 7 295 0 1 2 1
A 923 7 0 69 1 10 1
A 931 7 297 0 1 2 1
A 930 7 0 69 1 10 1
A 938 7 299 0 1 2 1
A 937 7 0 69 1 10 0
T 943 304 0 3 0 0
T 994 103 0 3 0 0
A 773 7 253 0 1 2 1
A 772 7 0 69 1 10 1
A 780 7 255 0 1 2 1
A 779 7 0 69 1 10 1
A 787 7 257 0 1 2 1
A 786 7 0 69 1 10 1
A 794 7 259 0 1 2 1
A 793 7 0 69 1 10 1
A 801 7 261 0 1 2 1
A 800 7 0 69 1 10 1
A 808 7 263 0 1 2 1
A 807 7 0 69 1 10 1
A 815 7 265 0 1 2 1
A 814 7 0 69 1 10 1
A 822 7 267 0 1 2 1
A 821 7 0 69 1 10 1
A 829 7 269 0 1 2 1
A 828 7 0 69 1 10 1
A 836 7 271 0 1 2 1
A 835 7 0 69 1 10 1
A 843 7 273 0 1 2 1
A 842 7 0 69 1 10 1
A 850 7 275 0 1 2 1
A 849 7 0 69 1 10 1
A 857 7 277 0 1 2 1
A 856 7 0 69 1 10 1
A 875 7 279 0 1 2 1
A 874 7 0 55 1 10 1
A 881 7 281 0 1 2 1
A 880 7 0 55 1 10 1
A 887 7 283 0 1 2 1
A 886 7 0 55 1 10 1
A 893 7 285 0 1 2 1
A 892 7 0 55 1 10 1
A 899 7 287 0 1 2 1
A 898 7 0 55 1 10 1
A 905 7 289 0 1 2 1
A 904 7 0 55 1 10 1
A 911 7 291 0 1 2 1
A 910 7 0 55 1 10 1
A 917 7 293 0 1 2 1
A 916 7 0 55 1 10 1
A 924 7 295 0 1 2 1
A 923 7 0 69 1 10 1
A 931 7 297 0 1 2 1
A 930 7 0 69 1 10 1
A 938 7 299 0 1 2 1
A 937 7 0 69 1 10 0
Z
