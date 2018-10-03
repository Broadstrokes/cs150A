

/*  TASK 01 */
select 
	cl_id,
	an_id,
	an_type,
	an_name
from vt_animals
	where an_type in 
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
where 
	an.an_type not in 
	  (
	    'snake',
	    'chelonian',
	    'crocodilian',
	    'lizard' 
	  ) 
  or 
  an.cl_id is null;
/*  TASK 04 */

select
	cl.cl_id as "cl_cl_id",
	cl.cl_name_last as "cl.cl_name_last",
	an.an_id as "an.an_id",
	an.an_name as "an.an_name",
	an.an_type as "an.an_type"
from vt_clients cl
	inner join vt_animals an
		on cl.cl_id = an.cl_id
	left join vt_exam_headers ex
		on an.an_id = ex.an_id
where 
	ex.an_id is null
order by
	an.cl_id,
	an.an_id
;



/*  TASK 05 */
  
/*  TASK 06 */

/*  TASK 07 */