use sakila;

SELECT last_name FROM actor;

# 1. What names are not repeated?
SELECT last_name, COUNT(*) cn FROM actor
GROUP BY last_name
HAVING cn = 1;


# 2. Which last names appear more than once?
SELECT last_name ln, COUNT(*) c_ln FROM actor 
GROUP BY ln
HAVING c_ln > 1;


# 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT COUNT(rental_id) r FROM rental
GROUP BY staff_id;



# 4. Using the film table, find out how many films there are of each rating.
SELECT rating, COUNT(film_id) f FROM film
GROUP BY rating;



# 5. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.
SELECT rating, ROUND(AVG(length),2) a_l FROM film
GROUP BY rating; 


# 6. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating FROM film
GROUP BY rating
HAVING AVG(length) > 120;



