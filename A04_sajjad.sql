

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
	an.cl_id as "an.cl_id",
	cl.cl_id as "cl.cl_id",
	cl.cl_name_last as "cl.cl_name_last"
from vt_clients cl
left join vt_animals an
on cl.cl_id = an.cl_id
where an.cl_id is null;

/*  TASK 03 */
select
	cl.cl_id as "cl_cl_id",
	cl.cl_name_last as "cl.cl_name_last"
from vt_clients cl
left join vt_animals an
on cl.cl_id = an.cl_id
where an.an_type 
	not in 
	  (
	    'snake',
	    'chelonian',
	    'crocodilian',
	    'lizard' 
	  ) 
  or an.cl_id is null;
/*  TASK 04 */

/*  TASK 05 */
  
/*  TASK 06 */

/*  TASK 07 */