/*  TASK 01  
We want to see the following data for each cat and dog: Client id,  
animal id, animal type and animal name. 
*/ 
SELECT cl_id, 
       an_id, 
       an_type, 
       an_name 
FROM   vt_animals 
WHERE  an_type IN ( 'cat', 'dog' ); 

/*  TASK 02   
Use a join to display the client id and last name for each  
client who does not have an animal.  
*/ 
SELECT an.cl_id        AS "an.cl_id", 
       cl.cl_id        AS "cl.cl_id", 
       cl.cl_name_last AS "cl.cl_name_last" 
FROM   vt_clients cl 
       LEFT JOIN vt_animals an 
              ON cl.cl_id = an.cl_id 
WHERE  an.cl_id IS NULL; 

/*  TASK 03  
  Display the client id and last name for each client who 
  has a non-reptile animal or no animals at all.  
  Read the  150A_VetsTables.pdfPreview the document for  
  the definition of a reptile.  This will exclude clients  
  who only have reptiles. 
*/ 
SELECT cl.cl_id        AS "cl_cl_id", 
       cl.cl_name_last AS "cl.cl_name_last" 
FROM   vt_clients cl 
       LEFT JOIN vt_animals an 
              ON cl.cl_id = an.cl_id 
WHERE  an.an_type NOT IN ( 'snake', 'chelonian', 'crocodilian', 'lizard' ) 
        OR an.cl_id IS NULL; 

/*  TASK 04 
We want to find animals for which we have no exam 
records (use the exam header table). Show the client 
id, and last name and the an_id, name and type for every 
animal that does not have any exam records in the exam table.  
Sort by the client id and animal id. 
*/ 
SELECT cl.cl_id        AS "cl_cl_id", 
       cl.cl_name_last AS "cl.cl_name_last", 
       an.an_id        AS "an.an_id", 
       an.an_name      AS "an.an_name", 
       an.an_type      AS "an.an_type" 
FROM   vt_clients cl 
       INNER JOIN vt_animals an 
               ON cl.cl_id = an.cl_id 
       LEFT JOIN vt_exam_headers ex 
              ON an.an_id = ex.an_id 
WHERE  ex.an_id IS NULL 
ORDER  BY an.cl_id, 
          an.an_id; 

/*  TASK 05  
For this task use the same logic as in Task 03 except 
 that your results should not display clients who have no animals. 
*/ 
SELECT cl.cl_id        AS "cl_cl_id", 
       cl.cl_name_last AS "cl.cl_name_last" 
FROM   vt_clients cl 
       LEFT JOIN vt_animals an 
              ON cl.cl_id = an.cl_id 
WHERE  an.an_type NOT IN ( 'snake', 'chelonian', 'crocodilian', 'lizard' ); 

/*  TASK 06  
Display the client id and client last name and the animal id 
, name, and date of birth for all animals owned by a client  
who lives in New York or Massachusetts but do not display rows 
 for any of the dogs, cats or birds. 
*/ 
SELECT cl.cl_id        AS "cl_cl_id", 
       cl.cl_name_last AS "cl.cl_name_last", 
       an.an_id        AS "an.an_id", 
       an.an_name      AS "an.an_name", 
       an.an_dob       AS "an.an_dob" 
FROM   vt_clients cl 
       INNER JOIN vt_animals an 
               ON cl.cl_id = an.cl_id 
WHERE  cl.cl_state IN ( 'MA', 'NY' ) 
       AND an.an_type NOT IN ( 'dog', 'cat', 'bird' ); 

/*  TASK 07 
Display data about services we have in the services table  
that have a list price of $100 or more and that have not  
been used on any exam. Display the service id, list price,  
description and service type. 
*/ 
SELECT srv.srv_id         AS "srv.srv_id", 
       srv.srv_list_price AS "srv.srv_list_price", 
       srv.srv_desc       AS "srv.srv_desc", 
       srv.srv_type       AS "srv.srv_type" 
FROM   vt_services srv 
       LEFT JOIN vt_exam_details ex 
              ON srv.srv_id = ex.srv_id 
WHERE  srv.srv_list_price >= 100 
       AND ex.srv_id IS NULL; 