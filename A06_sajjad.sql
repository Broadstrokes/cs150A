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

/*
TASK 02
Display customer id and name for all customers who have at least one order in March and at least one order in June and at least one order in September.
*/

	select 
		"Customer Name"
		,customer_id
		,order_id
		,order_date
	from 
		oeOrdersPriorYear
	where 
		order_month = 3
INTERSECT
	select 
		"Customer Name"
		,customer_id
		,order_id
		,order_date
	from 
		oeOrdersPriorYear
	where 
		order_month = 6
INTERSECT
	select 
			"Customer Name"
			,customer_id
			,order_id
			,order_date
		from 
			oeOrdersPriorYear
		where 
			order_month = 9
;




/*
	March 3
	April 4
	May 5
	June 6
	August 8
	September 9
 */