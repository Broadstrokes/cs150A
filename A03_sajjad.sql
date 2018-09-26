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
/*  TASK 02  */
select distinct
  srv_id 
from
  vt_exam_details 
where
  ex_fee >= 75;/*  TASK 03 */
select distinct
  cl_id,
  an_type 
from
  vt_animals 
where
  an_type in 
  (
    'snake',
    'chelonian',
    'crocodilian',
    'lizard' 
  )
order by
  cl_id;/*  TASK 04 */
select
  cl_id,
  an_id,
  an_type,
  an_name 
from
  vt_animals 
where
  an_type in 
  (
    'cat',
    'dog'
  );/*  TASK 05 */
select
  vt_exam_headers.ex_id,
  vt_exam_headers.ex_date,
  vt_exam_details.srv_id,
  vt_exam_details.ex_fee 
from
  vt_exam_headers 
  inner join
    vt_exam_details 
    on vt_exam_headers.ex_id = vt_exam_details.ex_id 
  inner join
    vt_animals 
    on vt_exam_headers.an_id = vt_animals.an_id 
where
  an_type in 
  (
    'hamster',
    'capybara',
    'porcupine',
    'dormouse' 
  )
order by
  ex_id,
/*  TASK 06 */
select
  vt_clients.cl_id,
  vt_exam_headers.ex_id,
  vt_exam_headers.ex_date,
  vt_exam_details.srv_id,
  vt_exam_details.ex_fee 
from
  vt_clients 
  inner join
    vt_animals 
    on vt_clients.cl_id = vt_animals.cl_id 
  inner join
    vt_exam_headers 
    on vt_animals.an_id = vt_exam_headers.an_id 
  inner join
    vt_exam_details 
    on vt_exam_headers.ex_id = vt_exam_details.ex_id 
where
  ex_fee < 25 
  or ex_fee > 200 
order by
  ex_date,
  srv_id;