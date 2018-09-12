
/* 
	Dan Sajjad
*/


/*  TASK 01 */
select 
	stf_name_first,
	stf_name_last,
	stf_job_title 
from 
	vt_staff;

/*  TASK 02  */
select
	an_id "ID",
	an_name "Name",
	an_type "Animal Type",
	an_dob "BirthDate"
from
	vt_animals
order by
	an_dob;

/*  TASK 04 */
select DISTINCT
	an_type
from 
	vt_animals;

/*  TASK 05 */
select
	ex_id,
	srv_id,
	ex_fee
from
	vt_exam_details
order by
	ex_id,
	ex_fee;

/*  TASK 06 */
select DISTINCT 
	an_name,
	an_type,
	an_dob
from
	vt_animals
order by
	an_type,
	an_name;

/*  TASK 07 */
select
	an_id,
	ex_date,
	stf_id
from
	vt_exam_headers
order by
	stf_id,
	ex_date;

/*  TASK 08 */
select DISTINCT
	cl_state,
	cl_city
from
	vt_clients
order by
	cl_state,
	cl_city;