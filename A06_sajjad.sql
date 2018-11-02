/*  */


/*
	oe_orderHeaders
	cust_customers

	customer_id, customer_name_last customer_name_first order_date, order_id
 */

/*
TASK 01
Create the view you will use in the rest of the assignment. Use the fewest table as possible in the view. Use the view name: oeOrdersPriorYear

*/

select 
	C.customer_name_first || ' ' || C.customer_name_last As "Customer Name"
	,C.customer_id
	,OH.order_id
	,OH.order_date
	,extract(month from OH.order_date) as order_month
from 
	oe_orderHeaders OH
join
	cust_customers C using(customer_id)
where
	extract(month from order_date) in (3, 4, 5, 6, 8, 9)
and
	extract(year from order_date) = 2015
order by
	"Customer Name"
;

create view oeOrdersPriorYear as
select 
	C.customer_name_first || ' ' || C.customer_name_last As "Customer Name"
	,C.customer_id
	,OH.order_id
	,OH.order_date
	,extract(month from OH.order_date) as order_month
from 
	oe_orderHeaders OH
join
	cust_customers C using(customer_id)
where
	extract(month from order_date) in (3, 4, 5, 6, 8, 9)
and
	extract(year from order_date) = 2015
order by
	"Customer Name"
;