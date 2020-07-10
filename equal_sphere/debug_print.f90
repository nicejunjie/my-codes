subroutine debug_print (iopt,string)

use commonv

implicit none

integer :: iopt,i,j,icoor,idist,iforce
character(*) :: string
character(16) :: fm

icoor = mod(iopt,10)
idist = mod(iopt,100) - icoor
iforce = mod(iopt/100,10)

if(iopt.ne.0) print *, string

if(icoor.ne.0) then
  print *, 'cartesian coordinate'
 do i = 1 ,n 
    print '(3(F15.8,2x))', (coor(j,i),j=1,3)
 end do 
end if

if(idist.ne.0) then
!print *, ''
 print *, 'distance matrix'
 write(fm,'(a,I4,a10,a)' ) '(',N,'(F15.8,2x)',')'
 do i =1 ,n 
   print fm, (dist_matrix(i,j),j=1,i)
 end do
!print '(3(F15.8,2x))',dist_matrix(2,1),dist_matrix(3,1),dist_matrix(3,2)
end if

if(iforce.ne.0)  then
print *, 'force in cartesian coordinate'
 do i =1, N 
   print '(3(F15.8,2x))', force(1,i), force(2,i), force(3,i) 
 enddo
end if



end subroutine debug_print
