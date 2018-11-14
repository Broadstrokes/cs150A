/* 
TASK 01 
Write the CREATE TABLE statements needed to create these tables.  Choose the appropriate data types for each column by looking at the sample data provided.  The create table statements should include a primary key constraint for each table and foreign key constraints for the tables that have foreign keys.

*/ 
CREATE TABLE bk_books 
  ( 
     book_id    NUMERIC(4, 0) CONSTRAINT bk_books_pk PRIMARY KEY, 
     title      VARCHAR(50) NOT NULL, 
     year_publd NUMERIC(4, 0) NOT NULL, 
     isbn       VARCHAR(25) NULL, 
     page_count NUMERIC(4, 0) NOT NULL, 
     list_price NUMERIC(6, 2) NOT NULL 
  ); 

CREATE TABLE bk_customers 
  ( 
     cust_id          NUMERIC(6, 0) CONSTRAINT bk_customers_pk PRIMARY KEY, 
     cust_name_last   VARCHAR(25) NOT NULL, 
     cust_name_first  VARCHAR(25) NULL, 
     cust_state       CHAR(2) NOT NULL, 
     cust_postal_code NUMERIC(5, 0) NOT NULL, 
     cust_acct_opened DATE NOT NULL 
  ); 

CREATE TABLE bk_order_headers 
  ( 
     order_id   NUMERIC(6, 0) CONSTRAINT bk_order_headers_pk PRIMARY KEY, 
     order_date DATE NOT NULL, 
     cust_id    NUMERIC(6, 0) NOT NULL, 
     FOREIGN KEY(cust_id) REFERENCES bk_customers 
  ); 

CREATE TABLE bk_order_details 
  ( 
     order_id    NUMERIC(6, 0) NOT NULL, 
     order_line  NUMERIC(1, 0) NOT NULL, 
     cust_id     NUMERIC(6, 0) NOT NULL, 
     book_id     NUMERIC(4, 0) NOT NULL, 
     quantity    NUMERIC(4, 0) NOT NULL, 
     order_price NUMERIC(6, 2) NOT NULL, 
     PRIMARY KEY(order_id, order_line), 
     FOREIGN KEY(order_id) REFERENCES bk_order_headers, 
     FOREIGN KEY(book_id) REFERENCES bk_books 
  ); 

/* 
TASK 02 
Write a minimum of 3 insert statements for each table using the sample data provided.  You should not write insert statements for ALL of the data, just select data for a minimum of three rows for each table.  Be careful to maintain referential integrity when choosing rows.
*/ 
/* bk_customers inserts */ 
INSERT INTO bk_customers 
            (cust_id, 
             cust_name_last, 
             cust_name_first, 
             cust_state, 
             cust_postal_code, 
             cust_acct_opened) 
VALUES      (226656, 
             'Randall', 
             'Randall', 
             'NJ', 
             8251, 
             '2012-08-08'); 

INSERT INTO bk_customers 
            (cust_id, 
             cust_name_last, 
             cust_name_first, 
             cust_state, 
             cust_postal_code, 
             cust_acct_opened) 
VALUES      (259906, 
             'Capybara', 
             'Wile E.', 
             'CA', 
             94132, 
             '2014-08-05'); 

INSERT INTO bk_customers 
            (cust_id, 
             cust_name_last, 
             cust_name_first, 
             cust_state, 
             cust_postal_code, 
             cust_acct_opened) 
VALUES      (221297, 
             'Dodgson', 
             'Charles', 
             'MI', 
             49327, 
             '2001-05-06'); 

/* bk_books inserts */ 
INSERT INTO bk_books 
            (book_id, 
             title, 
             year_publd, 
             isbn, 
             page_count, 
             list_price) 
VALUES      (1401, 
             'Visual Studio Tools for Office', 
             2006, 
             '321334884', 
             976, 
             54.99); 

INSERT INTO bk_books 
            (book_id, 
             title, 
             year_publd, 
             isbn, 
             page_count, 
             list_price) 
VALUES      (1305, 
             'Journeys Through Flatland', 
             1958, 
             '387515357', 
             100, 
             9.99); 

INSERT INTO bk_books 
            (book_id, 
             title, 
             year_publd, 
             isbn, 
             page_count, 
             list_price) 
VALUES      (1101, 
             'Programming SQL Server with VB.NET', 
             2002, 
             '735615357', 
             300, 
             59.99); 

/* bk_order_headers inserts */ 
INSERT INTO bk_order_headers 
            (order_id, 
             order_date, 
             cust_id) 
VALUES      (12900, 
             '2015-01-25', 
             226656); 

INSERT INTO bk_order_headers 
            (order_id, 
             order_date, 
             cust_id) 
VALUES      (12901, 
             '2015-01-26', 
             259906); 

INSERT INTO bk_order_headers 
            (order_id, 
             order_date, 
             cust_id) 
VALUES      (12855, 
             '2015-01-18', 
             221297); 

/* bk_order_details inserts */ 
INSERT INTO bk_order_details 
            (order_id, 
             order_line, 
             cust_id, 
             book_id, 
             quantity, 
             order_price) 
VALUES      (12900, 
             1, 
             226656, 
             1401, 
             20, 
             50); 

INSERT INTO bk_order_details 
            (order_id, 
             order_line, 
             cust_id, 
             book_id, 
             quantity, 
             order_price) 
VALUES      (12900, 
             2, 
             226656, 
             1305, 
             125, 
             5); 

INSERT INTO bk_order_details 
            (order_id, 
             order_line, 
             cust_id, 
             book_id, 
             quantity, 
             order_price) 
VALUES      (12901, 
             1, 
             259906, 
             1401, 
             50, 
             49); 

INSERT INTO bk_order_details 
            (order_id, 
             order_line, 
             cust_id, 
             book_id, 
             quantity, 
             order_price) 
VALUES      (12855, 
             1, 
             221297, 
             1101, 
             5, 
             59.99); 

/* 
TASK 03 
Write a query that will display the entire contents of all of your tables in the same format as the sample data.  To accomplish this, you will need to join all tables and display all columns.  Compare the output of your query to the sample data to confirm that your database accurately represents the data.
*/ 
SELECT bk_books.*, 
       bk_order_details.*, 
       bk_order_headers.*, 
       bk_customers.* 
FROM   bk_customers 
       INNER JOIN bk_order_headers using (cust_id) 
       INNER JOIN bk_order_details using (order_id) 
       INNER JOIN bk_books using (book_id); 