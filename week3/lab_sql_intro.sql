# Lab | Intro
USE sakila;

# Explore tables by selecting all columns from each table or using the in built review features for your client.
SELECT * from actor;

SELECT * from address;
# what does null mean?
# what is BLOB in location



#Select one column from a table. Get film titles.
SELECT title from film;

# Select one column from a table and alias it. 
SELECT amount FROM payment AS payment_amount;
# NOT SURE ABOUT THIS ONE!


# Get unique list of film languages under the alias language. 
SELECT * from language;

SELECT distinct name FROM LANGUAGE;


# Note that we are not asking you to obtain the language per each film, 
# but this is a good time to think about how you might get that information in the future.

# Get language of each film
SELECT * FROM film;
# interesting to see how to get the language of the film, as decoding is needed/ looking up from another tabel




# 5.1 Find out how many stores does the company have?
SELECT COUNT(store_id) from store;
# 2 stores only 



# 5.2 Find out how many employees staff does the company have?
SELECT COUNT(staff_id) from staff;
SELECT * FROM staff;
# just 2


#5.3 Return a list of employee first names only?
SELECT first_name FROM staff;