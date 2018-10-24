/*  TASK 01 */ 
/* 
For each row in the staff table, display the first name and last name of each staff person and their job title.
 */ 
SELECT stf_name_first, 
       stf_name_last, 
       stf_job_title 
FROM   vt_staff; 

/*  TASK 02  */ 
/* 
Display the animal id with a column alias of "ID", the animal name with a column alias of "Name", the animal type with the column alias "Animal Type", and the birth date with a column alias of "BirthDate" for each animal. Display the data with the oldest animals first.
 */ 
SELECT an_id   "ID", 
       an_name "Name", 
       an_type "Animal Type", 
       an_dob  "BirthDate" 
FROM   vt_animals 
ORDER  BY an_dob; 

/*  TASK 03 */ 
/* 
The vet wants to see a list of the different types of animals we currently have registered with the clinic. Display the animal types from the animals table. Suppress any duplicates.
 */ 
SELECT DISTINCT an_type 
FROM   vt_animals; 

/*  TASK 4 */ 
/* 
For each row in the services table, display the service type and description. The rows should be sorted by the service type and list price.
 */ 
/*  TASK 05 */ 
/* 
Display the exam id, the service id, and the fee charged for each service performed on an exam. Order by the exam id and then by the fee.
 */ 
SELECT ex_id, 
       srv_id, 
       ex_fee 
FROM   vt_exam_details 
ORDER  BY ex_id, 
          ex_fee; 

/*  TASK 06 */ 
/* 
Display the animal name and animal type and animal date of birth values from the animals table. Suppress any duplicates. Sort the display in order by the type as the first sort key and the name as the second sort key.
 */ 
SELECT DISTINCT an_name, 
                an_type, 
                an_dob 
FROM   vt_animals 
ORDER  BY an_type, 
          an_name; 

/*  TASK 07 */ 
/* 
For each exam, display the animal id, the exam date and the id of the staff person who did the exam. Display the rows in order by the staff id; use the exam date as the second sort key with the earlier exams first. Use the data in the exam headers table. 
 */ 
SELECT an_id, 
       ex_date, 
       stf_id 
FROM   vt_exam_headers 
ORDER  BY stf_id, 
          ex_date; 

/*  TASK 08 */ 
/* 
The vet wants a list of the different locations for the clients. For this task, the term location refers to the city and state. The display will include the client state in the first column and city in the second column and will not include duplicate rows. Sort the result set by state and city.
 */ 
SELECT DISTINCT cl_state, 
                cl_city 
FROM   vt_clients 
ORDER  BY cl_state, 
          cl_city; 