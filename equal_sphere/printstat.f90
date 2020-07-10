subroutine print_stat()

use commonv

if(istep.gt.maxstep) then
  print *, 'error, cannot achieve the requied job, try increase the max cycle'
  call debug_print(111,'error,max cycle reached  ')
end if 
if(iok.eq.1) then
  print *, ''
  print *, 'successfully finished in' , istep, ' steps'
if (iop.ne.0) call debug_print(111,'thank god ')
if (iop.eq.0) call debug_print(001,'thank god ')
end if

if(iop.ne.0) call projection()


end subroutine print_stat
