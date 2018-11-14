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
);