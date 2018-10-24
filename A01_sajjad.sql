/*  TASK 01 */ 
/* 
The first will remove any rows from the zoo_2016 table where the z_id  
value is greater than 100 and the second will show the rows in the table.  
At this point you should have the original rows that I supplied in the  
script. The rows I provided in the inserts script have a z_id value less  
than 100 and will not be deleted. 
*/ 
DELETE FROM zoo_2016 
WHERE  z_id > 100; 

SELECT * 
FROM   zoo_2016; 

/*  TASK 02  */ 
/* 
 Add an additional 3 rows to the table. For the animal id, use an animal  
 id value that is greater than 100. For the rest of the data, use any data  
 values you want. Post the sql for these 3 inserts to the forum named  
 A01_inserts. 
 */ 
INSERT INTO zoo_2016 
            (z_id, 
             z_name, 
             z_type, 
             z_cost, 
             z_dob, 
             z_acquired) 
VALUES      (200, 
             'Pink Panther', 
             'Panther', 
             20000.00, 
             '2018-08-01', 
             '2018-08-20'); 

INSERT INTO zoo_2016 
            (z_id, 
             z_name, 
             z_type, 
             z_cost, 
             z_dob, 
             z_acquired) 
VALUES      (190, 
             'Jim Raynor', 
             'Snake', 
             600.00, 
             '2017-01-01', 
             '2018-02-01'); 

INSERT INTO zoo_2016 
            (z_id, 
             z_name, 
             z_type, 
             z_cost, 
             z_dob, 
             z_acquired) 
VALUES      (120, 
             'Starfire', 
             'Starfish', 
             100.75, 
             '2002-06-30', 
             '2009-03-23'); 

/*  TASK 03 */ 
INSERT INTO zoo_2016 
            (z_id, 
             z_name, 
             z_type, 
             z_cost, 
             z_dob, 
             z_acquired) 
VALUES      (300, 
             'Jeremiah', 
             'Armadillo', 
             500.00, 
             '2014-06-15', 
             '2014-06-15'); 

INSERT INTO zoo_2016 
            (z_id, 
             z_name, 
             z_type, 
             z_cost, 
             z_dob, 
             z_acquired) 
VALUES      (301, 
             'Jarod', 
             'Giraffe', 
             5001.00, 
             '2014-07-15', 
             '2014-07-15'); 

INSERT INTO zoo_2016 
            (z_id, 
             z_name, 
             z_type, 
             z_cost, 
             z_dob, 
             z_acquired) 
VALUES      (302, 
             'Jasmin', 
             'Horse', 
             550.00, 
             '2014-08-15', 
             '2014-08-15'); 

INSERT INTO zoo_2016 
            (z_id, 
             z_name, 
             z_type, 
             z_cost, 
             z_dob, 
             z_acquired) 
VALUES      (101, 
             'Teemo', 
             'Racoon', 
             630.00, 
             '2016-11-11', 
             '2016-11-11'); 

INSERT INTO zoo_2016 
            (z_id, 
             z_name, 
             z_type, 
             z_cost, 
             z_dob, 
             z_acquired) 
VALUES      (178, 
             'Zulu', 
             'Dog', 
             530.00, 
             '2015-1-1', 
             '2015-3-1'); 

INSERT INTO zoo_2016 
            (z_id, 
             z_name, 
             z_type, 
             z_cost, 
             z_dob, 
             z_acquired) 
VALUES      (132, 
             'Snickers', 
             'Dog', 
             1030.00, 
             '2012-7-21', 
             '2014-2-9'); 

/*  TASK 04 */ 
SELECT z_id, 
       z_name, 
       z_type, 
       z_cost, 
       z_dob, 
       z_acquired 
FROM   zoo_2016; 

/*  TASK 05 */ 
/* 
Write and run the SQL statement so that it shows only three columns: the type of animal in the first column, the animal's name in the second column and the cost in the third column. Sort the rows by the animal type with a secondary sort on the name. (I am sure you can figure out how to do this.)
 */ 
SELECT z_type, 
       z_name, 
       z_cost 
FROM   zoo_2016 
ORDER  BY z_type, 
          z_name; 

/*  TASK 06 */ 
/* 
We want to see the id, name and date of birth of all of the zebras in the table. Display the id of animal in the first column, the animal's name in the second column and the date of birth in the third column. Sort by the date of birth with the youngest animals displayed first.
 */ 
SELECT z_id, 
       z_name, 
       z_dob 
FROM   zoo_2016 
WHERE  z_type = 'Zebra' 
ORDER  BY z_dob ASC; 

/*  TASK 07 */ 
SELECT * 
FROM   information_schema.tables 
WHERE  table_type = 'BASE TABLE'; 

/*  TASK 08 */ 
SELECT * 
FROM   information_schema.columns 
WHERE  table_name = 'zoo_2016'; 