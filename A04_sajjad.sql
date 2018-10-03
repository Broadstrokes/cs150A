

/*  TASK 01 */
select 
	cl_id,
	an_id,
	an_type,
	an_name
from vt_animals
	where   an_type in 
  (
    'cat',
    'dog'
  )

/*  TASK 02  */
select 
z_em_Emp.D_ID as "EM_Emp.D_ID"
, z_em_Dept.D_ID as "EM_Dept.D_ID"
, D_Name
from z_em_Dept 
LEFT JOIN z_em_Emp ON z_em_Dept.d_id = z_em_Emp.D_ID
where z_em_Emp.D_ID IS NULL;

select 
	vt_animals.cl_id,
	vt_clients.cl_id,
	vt_clients.cl_name_last
from vt_clients cl
left join vt_animals an
on vt_clients.cl_id = vt_animals.cl_id
where vt_animals.cl_id is null
;


/*  TASK 03 */

/*  TASK 04 */

/*  TASK 05 */
  
/*  TASK 06 */

/*  TASK 07 */