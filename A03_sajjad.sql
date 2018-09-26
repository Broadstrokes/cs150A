/*  TASK 01 */
select
  cl_name_first,
  cl_name_last,
  cl_phone 
from
  vt_clients 
where
  cl_phone is not null 
order by
  cl_id;
