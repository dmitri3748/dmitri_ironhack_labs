# lab sql basics (selection and aggregation)
use bank;



# Query 1
# Get the id values of the first 5 clients from district_id with a value equal to 1.
SELECT client_id FROM client
WHERE district_id = 1
LIMIT 5;



# Query 2
#In the client table, get an id value of the last client where the district_id is equal to 72
SELECT client_id 
FROM client 
WHERE district_id = 72 
ORDER BY client_id DESC
LIMIT 1;
# client_id = 13576



# Query 3
# Get the 3 lowest amounts in the loan table.
SELECT amount
FROM loan
ORDER BY amount 
LIMIT 3;


# Query 4
# What are the possible values for status, ordered alphabetically in ascending order in the loan table?
SELECT status
FROM loan
GROUP BY status
ORDER BY status;



# Query 5
# What is the loan_id of the highest payment received in the loan table?
SELECT loan_id, payments
FROM loan
ORDER BY payments DESC
LIMIT 1;


SELECT loan_id, payments
FROM loan
GROUP BY loan_id, payments
ORDER BY payments DESC
LIMIT 1;
# so, I select the two columns, then I say that I group by them
# I need to practice the group by more!
# The result set will contain distinct combinations of values in the "loan_id" and "payments" columns, and each combination will be represented by a single row in the output. Grouping by multiple columns can be useful when you need to group data by one column, but there are multiple values for that column that correspond to different values in another column. In such cases, you may need to group the data by both columns to get an accurate view of the data. In the provided code, the grouping by "loan_id" and "payments" ensures that each unique loan and payment amount combination is represented by a single row in the output.


# Query 6
# What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
SELECT account_id, amount
FROM loan
ORDER BY account_id
LIMIT 5;

# Query 7
# What are the top 5 account_ids with the lowest 
# loan amount that have a loan duration of 60 in the loan table?
# account ids with lowest amount and duration of 60
SELECT account_id
FROM loan
WHERE duration IN (60)
ORDER BY amount
LIMIT 5;




# Query 8!!!!!
# What are the unique values of k_symbol in the order table?
# Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause. You have to use backticks to escape the order table name.
SELECT DISTINCT k_symbol
FROM `order`;


# Query 9
# In the order table, what are the order_ids of the client with the account_id 34?
SELECT order_id
FROM `order`
WHERE account_id = 34;





# Query 10
# In the order table, which account_ids were responsible for 
# orders between order_id 29540 and order_id 29560 (inclusive)?
SELECT *
FROM `order`;


SELECT DISTINCT account_id
FROM `order`
WHERE order_id > 29540 AND order_id <= 29560;






# Query 11
# In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
SELECT *
FROM `order`;

SELECT amount
FROM `order`
WHERE account_to = 30067122;


# Query 12
# In the trans table, show the trans_id, date, 
# type and amount of the 10 first transactions from account_id 793 in 
# chronological order, from newest to oldest

SELECT *
FROM trans;

SELECT trans_id, `date`, `type`, amount
FROM trans
WHERE account_id = 793
ORDER BY date DESC
LIMIT 10;

# Query 13
# In the client table, of all districts with a district_id lower than 10, 
# how many clients are from each district_id? 
# Show the results sorted by the district_id in ascending order.



