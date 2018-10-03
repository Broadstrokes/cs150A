
/*  TASK 01 
We want to see the following data for each cat and dog: Client id, 
animal id, animal type and animal name.
*/
select 
	cl_id,
	an_id,
	an_type,
	an_name
from vt_animals
where 
	an_type in 
	  (
	    'cat',
	    'dog'
	  );

/*  TASK 02  
Use a join to display the client id and last name for each 
client who does not have an animal. 
*/
select 
	an.cl_id as "an.cl_id",
	cl.cl_id as "cl.cl_id",
	cl.cl_name_last as "cl.cl_name_last"
from vt_clients cl
	left join vt_animals an
		on cl.cl_id = an.cl_id
where an.cl_id is null;

/*  TASK 03 
	Display the client id and last name for each client who
	has a non-reptile animal or no animals at all. 
	Read the  150A_VetsTables.pdfPreview the document for 
	the definition of a reptile.  This will exclude clients 
	who only have reptiles.
*/
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

/*  TASK 04
We want to find animals for which we have no exam
records (use the exam header table). Show the client
id, and last name and the an_id, name and type for every
animal that does not have any exam records in the exam table. 
Sort by the client id and animal id.
*/
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
	an.an_id;

/*  TASK 05 
For this task use the same logic as in Task 03 except
 that your results should not display clients who have no animals.
*/
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
	  );

/*  TASK 06 
Display the client id and client last name and the animal id
, name, and date of birth for all animals owned by a client 
who lives in New York or Massachusetts but do not display rows
 for any of the dogs, cats or birds.
*/
select
	cl.cl_id as "cl_cl_id",
	cl.cl_name_last as "cl.cl_name_last",
	an.an_id as "an.an_id",
	an.an_name as "an.an_name",
	an.an_dob as "an.an_dob"
from vt_clients cl
	inner join vt_animals an
		on cl.cl_id = an.cl_id
where
	cl.cl_state in 
		(
			'MA',
			'NY'
		) 
AND
	an.an_type not in 
	  (
	    'dog',
	    'cat',
	    'bird'
	  );

/*  TASK 07
Display data about services we have in the services table 
that have a list price of $100 or more and that have not 
been used on any exam. Display the service id, list price, 
description and service type.
*/
select
	srv.srv_id as "srv.srv_id",
	srv.srv_list_price as "srv.srv_list_price",
	srv.srv_desc as "srv.srv_desc",
	srv.srv_type as "srv.srv_type"
from 
	vt_services srv
	left join vt_exam_details ex
		on srv.srv_id = ex.srv_id
where 
	srv.srv_list_price >= 100
and 
	ex.srv_id is null;