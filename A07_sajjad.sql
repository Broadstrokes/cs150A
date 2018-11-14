/*
TASK 01
Write the CREATE TABLE statements needed to create these tables.  Choose the appropriate data types for each column by looking at the sample data provided.  The create table statements should include a primary key constraint for each table and foreign key constraints for the tables that have foreign keys.

*/


create table bk_books(
	book_id							numeric(4,0)	constraint bk_books_pk primary key,
	title								varchar(50)		not null,
	year_publd					numeric(4,0)	not null,
	isbn								varchar(25)		null,
	page_count					numeric(4,0)	not null,
	list_price					numeric(6,2)	not null
);


create table bk_customers(
	cust_id							numeric(6,0)	constraint bk_customers_pk primary key,
	cust_name_last			varchar(25)		not null,
	cust_name_first			varchar(25)		null,
	cust_state					char(2)				not null,
	cust_postal_code		numeric(5,0)	not null,
	cust_acct_opened		date 					not null
);

create table bk_order_headers(
	order_id 							numeric(6,0)	constraint bk_order_headers_pk primary key,
	order_date						date 					not null,
	cust_id								numeric(6,0)	not null,
	foreign key(cust_id)	references bk_customers
);

create table bk_order_details(
	order_id 							numeric(6,0)	not null,
	order_line						numeric(1,0) 	not null,
	cust_id								numeric(6,0)	not null,
	book_id								numeric(4,0)	not null,
	quantity							numeric(4,0)	not null,
	order_price						numeric(6,2)	not null,
	primary key(order_id, order_line),
	foreign key(order_id) references bk_order_headers,
	foreign key(book_id)	references bk_books
);/*
TASK 02
Write a minimum of 3 insert statements for each table using the sample data provided.  You should not write insert statements for ALL of the data, just select data for a minimum of three rows for each table.  Be careful to maintain referential integrity when choosing rows.
*/

/* bk_customers inserts */
insert into bk_customers (cust_id, cust_name_last, cust_name_first, cust_state, cust_postal_code, cust_acct_opened)
  values (226656, 'Randall', 'Randall', 'NJ', 8251, '2012-08-08');

insert into bk_customers (cust_id, cust_name_last, cust_name_first, cust_state, cust_postal_code, cust_acct_opened)
  values (259906, 'Capybara', 'Wile E.', 'CA', 94132, '2014-08-05');

insert into bk_customers (cust_id, cust_name_last, cust_name_first, cust_state, cust_postal_code, cust_acct_opened)
  values (221297, 'Dodgson', 'Charles', 'MI', 49327, '2001-05-06');

/* bk_books inserts */
insert into bk_books (book_id, title, year_publd, isbn, page_count, list_price)
		values (1401, 'Visual Studio Tools for Office', 2006, '321334884', 976, 54.99);

insert into bk_books (book_id, title, year_publd, isbn, page_count, list_price)
		values (1305, 'Journeys Through Flatland', 1958, '387515357', 100, 9.99);

insert into bk_books (book_id, title, year_publd, isbn, page_count, list_price)
		values (1101, 'Programming SQL Server with VB.NET', 2002, '735615357', 300, 59.99);


/* bk_order_headers inserts */
insert into bk_order_headers(order_id, order_date, cust_id)
	values (12900, '2015-01-25', 226656);

insert into bk_order_headers(order_id, order_date, cust_id)
	values (12901, '2015-01-26', 259906);

insert into bk_order_headers(order_id, order_date, cust_id)
	values (12855, '2015-01-18', 221297);


/* bk_order_details inserts */
insert into bk_order_details (order_id, order_line, cust_id, book_id, quantity, order_price)
	values (12900, 1, 226656, 1401, 20, 50);

insert into bk_order_details (order_id, order_line, cust_id, book_id, quantity, order_price)
	values (12900, 2, 226656, 1305, 125, 5);

insert into bk_order_details (order_id, order_line, cust_id, book_id, quantity, order_price)
	values (12901, 1, 259906, 1401, 50, 49);

insert into bk_order_details (order_id, order_line, cust_id, book_id, quantity, order_price)
	values (12855, 1, 221297, 1101, 5, 59.99);
/*
TASK 03
Write a query that will display the entire contents of all of your tables in the same format as the sample data.  To accomplish this, you will need to join all tables and display all columns.  Compare the output of your query to the sample data to confirm that your database accurately represents the data.
*/


SELECT 
	bk_books.*,
	bk_order_details.*,
	bk_order_headers.*,
	bk_customers.*
FROM bk_customers 
	INNER JOIN bk_order_headers using (cust_id) 
	INNER JOIN bk_order_details using (order_id)
	INNER JOIN bk_books using (book_id);