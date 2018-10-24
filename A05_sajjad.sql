/*  TASK 01 
Display all clients and their animals if they have any. 
Display the following: client id, client last name, animal id, 
animal type, and animal name.
*/
select
	cl.cl_id as "cl_cl_id",
	cl.cl_name_last as "cl.cl_name_last",
	an.an_id as "an.an_id",
	an.an_type as "an.an_type",
	an.an_name as "an.an_name"
from vt_clients cl
	inner join vt_animals an
		using(cl_id);

/*  TASK 02 
Display all animals and their exam information if they have any exams. 
Display the following: animal id, animal type, and animal name, exam id, 
the year of the exam date, and the service id for any services on the exam
*/
select
	an.an_id,
	an.an_type,
	an.an_name,
	ex.ex_id,
	ex.ex_date
from vt_animals an
	inner join vt_exam_headers ex
	using (an_id);	

/*  TASK 03 
Display the client id and last name for each client who has 
at least one animal that is not a reptile.
*/
select distinct
	cl_id, 
	cl_name_last
from 
	vt_clients
where cl_id in (
	select distinct
		cl_id
	from 
		vt_animals
	where an_type not in 
		(
			'snake',
			'chelonian',
			'crocodilian',
			'lizard' 
		)
	);

/*  TASK 04 
Display the client id and last name for each client who 
does not have an animal.
*/
select 
	cl_id, 
	cl_name_last
from 
	vt_clients
where cl_id not in (
	select 
		cl_id
	from 
		vt_animals
);

/* TASK 05 
Display data about services we have in the services table that 
have a list price of $100 or more and that have not been used on any exam. 
Display the service id, list price, description and service type
*/
select distinct
	srv.srv_id as "srv.srv_id",
	srv.srv_list_price as "srv.srv_list_price",
	srv.srv_desc as "srv.srv_desc",
	srv.srv_type as "srv.srv_type"
from 
	vt_services srv
where srv.srv_id not in (
	select srv_id
	from vt_exam_details
)
and srv_list_price >= 100;


/*  TASK 06 
Display the client id and client last name for each client who owns a dog 
and owns a reptile.
*/
select distinct cl_id, cl_name_last
from vt_clients
where cl_id 
	in (
   select distinct cl_id
   from vt_animals
   where an_type
   in (
    'snake',
    'chelonian',
    'crocodilian',
    'lizard'
	 )
  )
and cl_id 
	in (
		select cl_id
		from vt_animals
		where an_type in ('dog')
);


/*  TASK 07
 * Display the client id and client last name for each client who 
 * owns a dog and does not own a reptile.
 */
select distinct cl_id, cl_name_last
from vt_clients
where cl_id 
not in (
 select distinct cl_id
 from vt_animals
 where an_type 
 in (
	  'snake',
	  'chelonian',
	  'crocodilian',
	  'lizard'
	)
)
and cl_id 
in (
	select cl_id
	from vt_animals
	where an_type 
	in ('dog')
);