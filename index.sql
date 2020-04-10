
--  Below are the exercises from a SQL course on uDemy. This first section is the first 5 sections before we start the advanced command part of the course. This was all done using postgres 12 and pgAdmin 4 in the browser, based off a provided database for a DVD rental company.


SELECT * FROM film;
SELECT * FROM actor;
SELECT first_name, last_name FROM actor;
SELECT first_name, last_name, email FROM customer;
SELECT DISTINCT(release_year) FROM film;
SELECT DISTINCT(rental_rate) FROM film;
SELECT DISTINCT(rating) FROM film;
SELECT * FROM payment;
SELECT COUNT(*) FROM payment;
SELECT COUNT(DISTINCT amount) FROM payment;
SELECT * FROM customer;
SELECT first_name, last_name FROM customer WHERE activebool = true;
SELECT * FROM customer;
SELECT first_name, last_name FROM customer WHERE store_id = 1;
SELECT * FROM film WHERE rental_rate > 4;
SELECT COUNT(*) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';
SELECT COUNT(*) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 OR rating = 'R';
SELECT email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas';
SELECT description FROM film WHERE title = 'Outlaw Hanky';
SELECT * FROM customer;
SELECT phone FROM address WHERE address = '259 Ipoh Drive';
SELECT * FROM customer ORDER BY first_name ASC;
SELECT * FROM customer ORDER BY first_name DESC;
SELECT * FROM customer ORDER BY store_id, first_name ASC;
SELECT store_id, first_name, last_name FROM customer ORDER BY store_id, first_name ASC, last_name DESC;
SELECT * FROM payment;
SELECT * FROM payment ORDER BY payment_date;
SELECT * FROM payment ORDER BY payment_date LIMIT 10;
SELECT * FROM payment WHERE amount != 0 ORDER BY payment_date LIMIT 10;
SELECT customer_id FROM payment ORDER BY payment_date LIMIT 10;
SELECT title FROM film ORDER BY length ASC LIMIT 5;
SELECT * FROM customer;
SELECT * FROM payment ORDER BY payment_date LIMIT 10;
SELECT COUNT(title) FROM film WHERE length <= 50;
SELECT * FROM payment;
SELECT * FROM payment WHERE amount BETWEEN 8 AND 9;
SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';
SELECT DISTINCT(amount) FROM payment WHERE amount BETWEEN 8 AND 9;
SELECT * FROM payment WHERE amount IN(0.99, 1.98, 1.99);
SELECT COUNT(*) FROM payment WHERE amount NOT IN(0.99, 1.98, 1.99);
SELECT * FROM customer WHERE first_name IN('John', 'Jake', 'Julie');
SELECT * FROM customer WHERE first_name LIKE 'J%';
SELECT * FROM customer WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';
SELECT * FROM customer WHERE first_name LIKE '%er%';
SELECT * FROM customer WHERE first_name LIKE '_er%';
SELECT * FROM customer WHERE first_name NOT LIKE '%er%';
SELECT * FROM customer WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%' ORDER BY last_name;
SELECT COUNT(amount) FROM payment WHERE amount > 5.00;
SELECT * FROM payment WHERE amount > 5.00;
SELECT COUNT(first_name) FROM actor WHERE first_name LIKE 'P%';
SELECT * FROM customer;
SELECT COUNT(DISTINCT(district)) FROM address;
SELECT * FROM address;
SELECT DISTINCT(district) FROM address;
SELECT COUNT(*) FROM film WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;
SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%';


SELECT * FROM film;
SELECT MIN(replacement_cost) FROM film;
SELECT MAX(replacement_cost) FROM film;
SELECT MIN(replacement_cost), MAX(replacement_cost) FROM film;
SELECT AVG(replacement_cost) FROM film;
SELECT ROUND(AVG(replacement_cost), 2) FROM film;
SELECT SUM(replacement_cost) FROM film;
SELECT * FROM payment;
SELECT customer_id FROM payment GROUP BY customer_id;
SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount)DESC;
SELECT customer_id, COUNT(amount) FROM payment GROUP BY customer_id ORDER BY COUNT(amount)DESC;
SELECT customer_id, staff_id, SUM(amount) FROM payment GROUP BY staff_id, customer_id ORDER BY customer_id;
SELECT DATE(payment_date) FROM payment;
SELECT DATE(payment_date), SUM(amount) FROM payment GROUP BY DATE(payment_date) ORDER BY SUM(amount) DESC;
SELECT staff_id, COUNT(amount) FROM payment GROUP BY staff_id;
SELECT rating, ROUND(AVG(replacement_cost), 2) FROM film GROUP BY rating;
SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 5;
SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id HAVING SUM(amount) > 100;
SELECT store_id, COUNT(customer_id) FROM customer GROUP BY store_id;
SELECT store_id, COUNT(customer_id) FROM customer GROUP BY store_id HAVING COUNT(*) > 300;
SELECT customer_id, COUNT(payment_date) FROM payment GROUP BY customer_id HAVING COUNT(payment_date) >= 40;
SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id, staff_id HAVING SUM(amount) > 100 AND staff_id = 2;
SELECT customer_id, SUM(amount) FROM payment WHERE staff_id = 2 GROUP BY customer_id HAVING SUM(amount) > 100;

SELECT customer_id, SUM(amount) FROM payment WHERE staff_id = 2 GROUP BY customer_id HAVING SUM(amount) > 110;
SELECT COUNT(*) FROM film WHERE title LIKE 'J%';
SELECT first_name, last_name FROM customer WHERE first_name LIKE 'E%' AND address_id < 500 ORDER BY customer_id DESC LIMIT 1;

SELECT * FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id;
SELECT payment_id, payment.customer_id, first_name FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id;

SELECT * FROM customer FULL OUTER JOIN payment ON customer.customer_id = payment.customer_id;
SELECT * FROM customer FULL OUTER JOIN payment ON customer.customer_id = payment.customer_id WHERE customer.customer_id IS null OR payment.payment_id IS null;

SELECT film.film_id, film.title, inventory_id FROM film LEFT OUTER JOIN inventory ON inventory.film_id = film.film_id;
SELECT film.film_id, film.title, inventory_id FROM film LEFT OUTER JOIN inventory ON inventory.film_id = film.film_id WHERE inventory.film_id IS null;


-- Below is the rest of the class.

SHOW ALL;
SHOW TIMEZONE;
SELECT NOW();
SELECT TIMEOFDAY();
SELECT CURRENT_TIME;
SELECT CURRENT_DATE;
SELECT EXTRACT(YEAR FROM payment_date) FROM payment;
SELECT EXTRACT(YEAR FROM payment_date) AS my_year FROM payment;
SELECT AGE(payment_date) FROM payment;

SELECT TO_CHAR(payment_date,'MONTH of YYYY') FROM payment;
SELECT TO_CHAR(payment_date,'mon/dd of YYYY') FROM payment;
SELECT TO_CHAR(payment_date,'MM-DD-YYYY') FROM payment;

SELECT DISTINCT(TO_CHAR(payment_date,'Month')) FROM payment;
SELECT COUNT (*) FROM payment WHERE EXTRACT(dow FROM payment_date) = 1;

SELECT * FROM film;
SELECT ROUND(rental_rate/replacement_cost, 2)*100 FROM film;
SELECT 0.1 * replacement_cost FROM film;

SELECT * FROM customer;
SELECT LENGTH(first_name) FROM customer;
SELECT first_name || last_name FROM customer;
SELECT first_name || ' ' || last_name AS full_name FROM customer;
SELECT UPPER(first_name) || ' ' || UPPER(last_name) AS full_name FROM customer;
SELECT LOWER(LEFT(first_name,1))||LOWER(last_name)||'@gmail.com' FROM customer;

SELECT title, rental_rate FROM film WHERE rental_rate > (SELECT AVG(rental_rate)FROM film);
SELECT film_id, title FROM film WHERE film_id IN (SELECT inventory.film_id FROM rental INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30') ORDER BY title;
SELECT first_name, last_name FROM customer AS customer WHERE EXISTS (SELECT * FROM payment AS paid WHERE paid.customer_id = customer.customer_id AND amount > 11);

SELECT f1.title, f2.title, f1.length FROM film AS f1 INNER JOIN film AS f2 ON f1.film_id != f2.film_id AND f1.length = f2.length;



-- These are the query's for the end of the the 2/3 through the course assesment. This is the last part before CREATE...

SELECT * FROM cd.facilities;
SELECT * FROM cd.bookings;
SELECT * FROM cd.members;
SELECT name, membercost FROM cd.facilities;
SELECT * FROM cd.facilities WHERE membercost > 0;
SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities WHERE membercost > 0 AND (membercost < monthlymaintenance/50.0);
SELECT * FROM cd.facilities WHERE name LIKE '%Tennis%';
SELECT * FROM cd.facilities WHERE facid IN (1,5);
SELECT memid, surname, firstname, joindate FROM cd.members WHERE joindate >='2012-09-01';
SELECT DISTINCT surname FROM cd.members ORDER BY surname LIMIT 10;
SELECT MAX(joindate) AS latest FROM cd.members;
SELECT COUNT(*) FROM cd.facilities WHERE guestcost >= 10;
SELECT facid, SUM(slots) AS "Total Slots" FROM cd.bookings WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01' GROUP BY facid ORDER BY SUM(slots);
SELECT facid, SUM(slots) AS "Total Slots" FROM cd.bookings GROUP BY facid HAVING SUM(slots) > 1000 ORDER BY facid;
SELECT bks.starttime AS START, facs.name AS name FROM cd.facilities facs INNER JOIN cd.bookings bks ON facs.facid = bks.facid WHERE facs.facid IN (0,1) AND bks.starttime >= '2012-09-21' AND bks.starttime < '2012-09-22' ORDER BY bks.starttime;
SELECT bks.starttime FROM cd.bookings bks INNER JOIN cd.members mems ON mems.memid = bks.memid WHERE mems.firstname='David' AND mems.surname='Farrell';

-- CREATE TABLE SECTION
CREATE DATABASE learning;
CREATE TABLE account(
  user_id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(50) NOT NULL,
  email VARCHAR(250) UNIQUE NOT NULL,
  created_on TIMESTAMP NOT NULL,
  last_login TIMESTAMP
)
CREATE TABLE job(
  job_id SERIAL PRIMARY KEY NOT NULL,
  job_name VARCHAR(200) UNIQUE NOT NULL
 
)
CREATE TABLE account_job(
  user_id INTEGER REFERENCES account(user_id),
  job_id INTEGER REFERENCES job(job_id),
  hire_date TIMESTAMP
)
INSERT INTO account(username,password,email,created_on)
VALUES('Jose', 'viva', 'vivajose@gmail.com',CURRENT_TIMESTAMP);

INSERT INTO account_job(user_id,job_id,hire_date)
VALUES(1,1,CURRENT_TIMESTAMP)

INSERT INTO job(job_name)
VALUES('Carpenter')

INSERT INTO job(job_name)
VALUES('musician')

UPDATE account
SET last_login = created_on;

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login;

DELETE FROM table WHERE row_id=1;
DELETE FROM tableA
USING tableB WHERE tableA.id=tableB.id

DELETE FROM job WHERE job_name = 'killer' RETURNING job_id,job_name;

ALTER TABLE information
RENAME TO new_info;

ALTER TABLE new_info
RENAME COLUMN person TO people;

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

ALTER TABLE new_info
ALTER COLUMN people SET NOT NULL;

ALTER TABLE new_info
DROP COLUMN people;

ALTER TABLE new_info
DROP COLUMN IF EXISTS people;
 
 CREATE TABLE employees(
  emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK (birthdate > '1900-01-01'),
	hire_date DATE CHECK (hire_date > birthdate),
	salary INTEGER CHECK (salary > 0)
)

-- This will fail on check constraints
INSERT INTO employees(
	first_name,
	last_name,
	birthdate,
	hire_date,
	salary
)
VALUES(
'Jose',
	'Chicano',
	'1899-11-03',
	'2010-01-01',
	100
)

INSERT INTO employees(
	first_name,
	last_name,
	birthdate,
	hire_date,
	salary
)
VALUES(
'Jose',
	'Chicano',
	'1990-11-03',
	'2010-01-01',
	100
)

CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	graduation_year INTEGER NOT NULL
	
)

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER NOT NULL,
	department VARCHAR(250) NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL
	
)

INSERT INTO (first_name,last_name,homeroom_number,phone,email,graduation_year)
VALUES('Mark','Watney', 5, '777-555-1234', 'N/A', 2035);


INSERT INTO teachers(first_name,last_name,homeroom_number,department,phone,email)
VALUES('Jonas','Salk', 5, 'Biology','777-555-4231', 'jsalk@school.org');


SELECT customer_id,
CASE
WHEN (customer_id <= 100) THEN 'Premium'
WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
ELSE 'Normal' 
END AS status
FROM customer;

SELECT customer_id,
CASE customer_id
WHEN 2 THEN 'Winner'
WHEN 5 THEN 'Second Place'
ELSE 'Normal'
END AS raffle_results
FROM customer;

SELECT
SUM(CASE rental_rate 
WHEN 0.99 THEN 1
ELSE 0
END) AS number_of_bargains
FROM film;

SELECT
SUM(CASE rental_rate 
WHEN 0.99 THEN 1
ELSE 0
END) AS bargains,
SUM(CASE rental_rate 
WHEN 2.99 THEN 1
ELSE 0
END) AS regular
FROM film;

SELECT
SUM(CASE rental_rate 
WHEN 0.99 THEN 1
ELSE 0
END) AS bargains,
SUM(CASE rental_rate 
WHEN 2.99 THEN 1
ELSE 0
END) AS regular,
SUM(CASE rental_rate 
WHEN 4.99 THEN 1
ELSE 0
END) AS premium
FROM film;

SELECT
SUM(CASE rating 
WHEN 'R' THEN 1 ELSE 0
END) AS r,
SUM(CASE rating 
WHEN 'PG-13' THEN 1 ELSE 0
END) AS pg_13,
SUM(CASE rating 
WHEN 'PG' THEN 1 ELSE 0
END) AS pg,
SUM(CASE rating 
WHEN 'G' THEN 1 ELSE 0
END) AS g
FROM film;


-- This is the only thing covered on Coalesce. It basically changes a null value to a specified integer to be able to perform accurate mathematical calculations, instead of getting a null result in the query return. 

SELECT item,(price-COALESCE(discout,)) AS final FROM table;

SELECT CAST('5' AS INTEGER);
--This fails
SELECT CAST('five' AS INTEGER);
--Works the same way with the operator
SELECT '5'::INTEGER;

SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental;

SELECT(
  SUM(CASE WHEN department = 'A'THEN 1 ELSE 0 END)/
  SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
  AS ratio
  FROM depts
);


SELECT(
  SUM(CASE WHEN department = 'A'THEN 1 ELSE 0 END)/
  NULLIF(
  SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END),0
  )
  AS ratio
  FROM depts
);

--View is like making a common query a shortcut keyword

CREATE VIEW customer_info AS
SELECT first_name,last_name,address FROM customer 
INNER JOIN address
ON customer.address_id = address.adress_id;

--Same action
SELECT * FROM customer_info;

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name,last_name,address,district FROM customer 
INNER JOIN address
ON customer.address_id = address.adress_id;

DROP VIEW IF EXISTS customer_info;

ALTER VIEW customer_info RENAME TO almost_done;

--To import a .csv file, you need full path, and you have to create the table first. The copy or import assumes that your database and table are already setup.(csv = comma seperated values)

--Right click on a table, click import/export. Then you need full file path. Header, YES. It matches both database and csv. Delimiter = , Quote = " or '





