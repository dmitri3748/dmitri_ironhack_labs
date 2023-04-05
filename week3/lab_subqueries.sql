use sakila;
# 1. List all films whose length is longer than the average of all the films.
SELECT title
FROM film
WHERE length > (SELECT AVG(length)
					FROM film);
                    
                    
                    
# 2. How many copies of the film Hunchback Impossible exist in the inventory system?
# get the film_id of the film with title Hunchback Impossible; count how many inventory_ids have this film id
SELECT COUNT(inventory_id)
FROM inventory
WHERE film_id IN ( SELECT film_id
					FROM film
					WHERE title = 'Hunchback Impossible');



# 3. Use subqueries to display all actors who appear in the film Alone Trip.
# actors in the film Alone Trip
SELECT first_name, last_name
FROM actor
WHERE actor_id IN ( SELECT actor_id
					FROM film_actor
                    WHERE film_id IN ( SELECT film_id
										FROM film
                                        WHERE title = 'Alone Trip'));


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
SELECT first_name, last_name, email FROM customer






