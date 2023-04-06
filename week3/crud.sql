use sakila;



CREATE DATABASE Ironhack;

USE Ironhack;

CREATE TABLE students (
student_id INT PRIMARY KEY,
first_name VARCHAR(55),
last_name VARCHAR(55),
age INT);


INSERT INTO students (student_id, first_name, last_name, age)
VALUES (1, 'Jorge', 'Aguilar', 25);



SELECT * FROM students;



UPDATE students
SET age = 30
WHERE first_name = 'Jorge';



DROP table students;



