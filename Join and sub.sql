--Questions

--1. List all customers who live in Texas (use JOINs) 

select first_name , last_name , district
from customer c
join address a
	on c.address_id = a.address_id
where a.district  = 'Texas'


--2. Get all payments above $6.99 with the Customer's Full Name.

select first_name , last_name , amount
from customer c 
join payment p 
	on c.customer_id = p.customer_id 
where p.amount > 6.99


--3. Show all customers names who have made payments over $175(use subqueries) 

select first_name, last_name
from customer c 
join payment p 
	on c.customer_id = p.customer_id 
where c.customer_id in (
	select customer_id 
	from payment p2 
	group by p2.customer_id 
	having sum(amount) > 175 
)
group by c.first_name, c.last_name 


--4. List all customers that live in Nepal (use the city table) 

select*
from customer c 
join address a 
	on c.address_id = a.address_id 
join city c2 
	on a.city_id = c2.city_id
join country c3 
	on c2.country_id = c3.country_id 
where c3.country = 'Nepal'


--5. Which staff member had the most transactions?

select first_name, last_name, s.staff_id, count(r.staff_id) 
from staff s 
join rental r 
	on s.staff_id = r.staff_id 
group by r.staff_id, first_name, last_name, s.staff_id 


--6. How many movies of each rating are there? 

select rating, count(rating) 
from film f 
group by rating 


--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

select p.customer_id, first_name, last_name
from payment p 
join customer c 
	on p.customer_id = c.customer_id
where amount > ( select count(distinct amount) 
	from payment p 
	where amount  > 6.99
	);


--8. How many free rentals did our stores give away?

select first_name, last_name, rental_id, amount 
from payment p 
join customer c 
	on p.customer_id = c.customer_id 
where amount <= 0


