use sakila;
# 1. List all films whose length is longer than the average of all the films.
SELECT title FROM film WHERE length > (
	SELECT AVG(length) FROM film);
                    
                    
                    
# 2. How many copies of the film Hunchback Impossible exist in the inventory system?
# get the film_id of the film with title Hunchback Impossible; count how many inventory_ids have this film id
SELECT COUNT(inventory_id) FROM inventory WHERE film_id IN ( 
	SELECT film_id FROM film WHERE title = 'Hunchback Impossible');



# 3. Use subqueries to display all actors who appear in the film Alone Trip.
# actors in the film Alone Trip
SELECT first_name, last_name FROM actor WHERE actor_id IN ( 
	SELECT actor_id FROM film_actor WHERE film_id IN ( 
		SELECT film_id FROM film WHERE title = 'Alone Trip'));



# 4. Identify all movies categorized as family films.
SELECT title FROM film WHERE film_id IN (
	SELECT film_id FROM film_category WHERE category_id IN (
		SELECT category_id FROM category WHERE name = 'Family'));



# 5. Get name and email from customers from Canada using subqueries. 
SELECT first_name, last_name, email FROM customer WHERE address_id IN (
	SELECT address_id FROM address WHERE city_id IN (
		SELECT city_id FROM city WHERE country_id IN (
			SELECT country_id FROM country WHERE country = 'Canada')));



# 5. Do the same with joins. Note that to create a join, 
# you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT first_name, last_name, email FROM customer cu
INNER JOIN address a ON cu.address_id = a.address_id
	INNER JOIN city ci ON a.city_id = ci.city_id
		INNER JOIN country co ON ci.country_id = co.country_id WHERE country = 'Canada';



# 6. Which films are starred by the most prolific actor? 
# Most prolific actor is defined as the actor that has acted in the most number of films.
# 1. find the most prolific actor 
# 2. use that actor_id to find the different films that he/she starred.
select title from sakila.film where film_id in (
	select film_id from sakila.film_actor where actor_id = (
		select actor_id from (
			select actor_id, count(film_id) as films_done from sakila.film_actor group by 1 order by films_done desc limit 1) as tab));


select title
from film
where film_id in (
	select film_id 
    from film_actor 
    where actor_id = (
		select actor_id from film_actor group by actor_id order by count(film_id) DESC LIMIT 1));
        


#####7.Films rented by most profitable customer. 
###You can use the customer table and payment table to find the most profitable customer 
###ie the customer that has made the largest sum of payments
select title
from film 
where film_id in(
         select film_id 
         from inventory 
         where inventory_id in( select inventory_id 
         from rental 
         where customer_id =(select customer_id
         from payment group by customer_id order by sum(payment.amount) desc limit 1)));





use sakila;


# 8. 
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
                    SELECT customer_id
                    FROM payment
                    GROUP BY customer_id
                    HAVING sum(amount) > (SELECT AVG(total) FROM (SELECT sum(amount) AS total
                                                                    FROM payment 
                                                                    GROUP BY customer_id) AS total_customer))
ORDER BY first_name, last_name;


