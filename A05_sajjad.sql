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
