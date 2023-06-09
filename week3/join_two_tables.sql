# join_two_tables
USE sakila;

# 1. Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, COUNT(film_id) AS count FROM actor AS a 
INNER JOIN film_actor AS f
USING (actor_id)
GROUP BY f.actor_id
ORDER BY count DESC
LIMIT 1;


# 2. Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, COUNT(rental_id) AS count FROM customer AS c
INNER JOIN rental AS r
USING (customer_id)
GROUP BY c.customer_id
ORDER BY count DESC
LIMIT 1;


# 3. List number of films per category.
SELECT cat.name, COUNT(film_id) AS count 
FROM category AS cat
INNER JOIN film_category AS fc
USING (category_id)
GROUP BY fc.category_id
ORDER BY cat.name;



# 4. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM staff AS s
INNER JOIN address AS a
USING (address_id);




# 5. Get films titles where the film language is either English or italian, 
SELECT f.title, l.name
FROM film AS f
INNER JOIN `language` as l
USING (language_id)
WHERE (l.name = 'English' OR l.name = 'Italian') AND f.title LIKE 'M%'
ORDER BY f.title DESC;

# or
SELECT fi.title, lan.name
FROM language AS lan
INNER JOIN film AS fi
ON fi.language_id = lan.language_id
WHERE fi.title REGEXP "^M" AND (fi.language_id = "1" OR fi.language_id = "2");


# 6. Display the total amount rung up by each staff member in August of 2005.
SELECT s.first_name, s.last_name, SUM(amount) AS sum
FROM staff AS s
INNER JOIN payment AS p
USING (staff_id)
WHERE p.payment_date BETWEEN 20050801 AND 20050831
GROUP BY s.staff_id 
ORDER BY sum DESC;


# 7. List each film and the number of actors who are listed for that film.
SELECT f.title, COUNT(fa.actor_id) AS count
FROM film AS f
INNER JOIN film_actor AS fa
USING (film_id)
GROUP BY f.title
ORDER BY count DESC
LIMIT 10;




# Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(amount) AS sum
FROM customer AS c
INNER JOIN payment AS p
USING (customer_id)
GROUP BY c.last_name, c.first_name
ORDER BY c.last_name;




# 9. Write sql statement to check if you can find any actor who never particiapted in any film.
SELECT actor_id FROM actor
INNER JOIN film_actor
USING (actor_id)
WHERE ;















