subroutine readkey()
use commonv

implicit none

 integer :: I,J,K,value_int
 REAL(8) :: value_real
 character(80) :: string
 character(40) :: key_words, value_str

 DO
         READ(*,'(a80)') string
         call lower_CASE(string)
         string=trim(string)
         IF(string == '') EXIT
         IF(string(1:1) == '!') CYCLE
         I=Index(string,'=')
         key_words=string(1:I-1)

         SELECT CASE(trim(key_words))
         CASE ('threshold','thre')
                 READ(string(I+1:80),*) value_real
                 Threshold = value_real
         CASE ('stepsize')
                 READ(string(I+1:80),*) value_real
                 stepsize = value_real
         CASE ('r','radius')
                 READ(string(I+1:80),*) value_real
                 radius = value_real 
         CASE ('n') 
               READ(string(I+1:80),*) value_int
               n=value_int
         CASE ('maxstep')
               READ(string(I+1:80),*) value_int
               maxstep = value_int
         CASE ('iop')
               READ(string(I+1:80),*) value_int
               iop = value_int
         END SELECT

 end do 



end subroutine readkey
