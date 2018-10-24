/*  TASK 01  
Display all clients and their animals if they have any.  
Display the following: client id, client last name, animal id,  
animal type, and animal name. 
*/ 
SELECT cl.cl_id        AS "cl_cl_id", 
       cl.cl_name_last AS "cl.cl_name_last", 
       an.an_id        AS "an.an_id", 
       an.an_type      AS "an.an_type", 
       an.an_name      AS "an.an_name" 
FROM   vt_clients cl 
       INNER JOIN vt_animals an using(cl_id); 

/*  TASK 02  
Display all animals and their exam information if they have any exams.  
Display the following: animal id, animal type, and animal name, exam id,  
the year of the exam date, and the service id for any services on the exam 
*/ 
SELECT an.an_id, 
       an.an_type, 
       an.an_name, 
       ex.ex_id, 
       ex.ex_date 
FROM   vt_animals an 
       INNER JOIN vt_exam_headers ex using (an_id); 

/*  TASK 03  
Display the client id and last name for each client who has  
at least one animal that is not a reptile. 
*/ 
SELECT DISTINCT cl_id, 
                cl_name_last 
FROM   vt_clients 
WHERE  cl_id IN (SELECT DISTINCT cl_id 
                 FROM   vt_animals 
                 WHERE  an_type NOT IN ( 'snake', 'chelonian', 'crocodilian', 
                                         'lizard' 
                                       )); 

/*  TASK 04  
Display the client id and last name for each client who  
does not have an animal. 
*/ 
SELECT cl_id, 
       cl_name_last 
FROM   vt_clients 
WHERE  cl_id NOT IN (SELECT cl_id 
                     FROM   vt_animals); 

/* TASK 05  
Display data about services we have in the services table that  
have a list price of $100 or more and that have not been used on any exam.  
Display the service id, list price, description and service type 
*/ 
SELECT DISTINCT srv.srv_id         AS "srv.srv_id", 
                srv.srv_list_price AS "srv.srv_list_price", 
                srv.srv_desc       AS "srv.srv_desc", 
                srv.srv_type       AS "srv.srv_type" 
FROM   vt_services srv 
WHERE  srv.srv_id NOT IN (SELECT srv_id 
                          FROM   vt_exam_details) 
       AND srv_list_price >= 100; 

/*  TASK 06  
Display the client id and client last name for each client who owns a dog  
and owns a reptile. 
*/ 
SELECT DISTINCT cl_id, 
                cl_name_last 
FROM   vt_clients 
WHERE  cl_id IN (SELECT DISTINCT cl_id 
                 FROM   vt_animals 
                 WHERE  an_type IN ( 'snake', 'chelonian', 'crocodilian', 
                                     'lizard' )) 
       AND cl_id IN (SELECT cl_id 
                     FROM   vt_animals 
                     WHERE  an_type IN ( 'dog' )); 

/*  TASK 07 
 * Display the client id and client last name for each client who  
 * owns a dog and does not own a reptile. 
 */ 
SELECT DISTINCT cl_id, 
                cl_name_last 
FROM   vt_clients 
WHERE  cl_id NOT IN (SELECT DISTINCT cl_id 
                     FROM   vt_animals 
                     WHERE  an_type IN ( 'snake', 'chelonian', 'crocodilian', 
                                         'lizard' 
                                       )) 
       AND cl_id IN (SELECT cl_id 
                     FROM   vt_animals 
                     WHERE  an_type IN ( 'dog' )); 