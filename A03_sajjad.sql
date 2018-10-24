/*  TASK 01 */ 
/* 
Show the client first and last name and phone number; skip all clients who do not have a value for the phone number. The display should be sorted by the client id.
 */ 
SELECT cl_name_first, 
       cl_name_last, 
       cl_phone 
FROM   vt_clients 
WHERE  cl_phone IS NOT NULL 
ORDER  BY cl_id; 

/*  TASK 02  */ 
/* 
Display the service id of any services that were actually used(charged for) on an exam which were charged at a fee of $75 or more. Display each service id only once.
 */ 
SELECT DISTINCT srv_id 
FROM   vt_exam_details 
WHERE  ex_fee >= 75; 

/*  TASK 03 */ 
/* 
The vet wants a list of client ids for clients who have one or more reptiles (defined in the 150A_VetsTables.pdf) .  Display the client id and the animal type for these clients. The vet does not care how many animals the clients have, only the client id and types. Sort by the client id. 
 */ 
SELECT DISTINCT cl_id, 
                an_type 
FROM   vt_animals 
WHERE  an_type IN ( 'snake', 'chelonian', 'crocodilian', 'lizard' ) 
ORDER  BY cl_id; 

/*  TASK 04 */ 
/* 
We want to see the following data for each cat and dog: Client id, animal id, animal type and animal name.
 */ 
SELECT cl_id, 
       an_id, 
       an_type, 
       an_name 
FROM   vt_animals 
WHERE  an_type IN ( 'cat', 'dog' ); 

/*  TASK 05 */ 
/* 
Display the exam id, exam date and service id and the fee charged for each exam done on a rodent. Read the 150A_VetsTables.pdf for the definition of the term 'rodent'. Order the rows by the exam id and service id.
 */ 
SELECT vt_exam_headers.ex_id, 
       vt_exam_headers.ex_date, 
       vt_exam_details.srv_id, 
       vt_exam_details.ex_fee 
FROM   vt_exam_headers 
       INNER JOIN vt_exam_details 
               ON vt_exam_headers.ex_id = vt_exam_details.ex_id 
       INNER JOIN vt_animals 
               ON vt_exam_headers.an_id = vt_animals.an_id 
WHERE  an_type IN ( 'hamster', 'capybara', 'porcupine', 'dormouse' ) 
ORDER  BY ex_id, 
          srv_id; 

/*  TASK 06 */ 
/* 
The vet is concerned about exams where the exam fee charged is less than $25.00 or more than $200.00. Show the client id, exam id and exam date, the service id and the exam fee for these exams. Order by the exam date and the service id.
 */ 
SELECT vt_clients.cl_id, 
       vt_exam_headers.ex_id, 
       vt_exam_headers.ex_date, 
       vt_exam_details.srv_id, 
       vt_exam_details.ex_fee 
FROM   vt_clients 
       INNER JOIN vt_animals 
               ON vt_clients.cl_id = vt_animals.cl_id 
       INNER JOIN vt_exam_headers 
               ON vt_animals.an_id = vt_exam_headers.an_id 
       INNER JOIN vt_exam_details 
               ON vt_exam_headers.ex_id = vt_exam_details.ex_id 
WHERE  ex_fee < 25 
        OR ex_fee > 200 
ORDER  BY ex_date, 
          srv_id; 