-- 1. List all customers who live in Texas (use JOINs)
SELECT customer.first_name, customer.last_name, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, payment_id, amount
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
select first_name,last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by payment.customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
);

-- 4. List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal' 

-- 5. Which staff member had the most transactions?
select staff.first_name, staff.last_name, count(payment_id)
from staff
full join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id
order by count(payment_id) desc;

-- 6. How many movies of each rating are there?
select rating, count(rating)
from film
group by rating 
order by count(rating) asc;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name, customer_id 
from customer
where customer_id in (
	select customer_id
	from payment
	group by payment.payment_id
	having count(payment_id) = 1 and amount > 6.99
	order by customer_id asc
);


-- 8. How many free rentals did our stores give away?
SELECT *
FROM payment
WHERE rental_id IN (
	SELECT rental_id
	FROM rental
	WHERE amount = 0
);

SELECT count(rental_id)
FROM payment
WHERE rental_id IN (
	SELECT rental_id
	FROM rental
	WHERE amount = 0
);


select * from rental;
select * from store;
select * from payment;





