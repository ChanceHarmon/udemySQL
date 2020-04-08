'use strict';


//Below are the exercises from a SQL course on uDemy. This first section is the first 5 sections before we start the advanced command part of the course. This was all done using postgres 12 and pgAdmin 4 in the browser, based off a provided database for a DVD rental company.

//I know it is all commented, but I didn't want to turn of my js/ts validation just for one file. 

// SELECT * FROM film;
// SELECT * FROM actor;
// SELECT first_name, last_name FROM actor;
// SELECT first_name, last_name, email FROM customer;
// SELECT DISTINCT(release_year) FROM film;
// SELECT DISTINCT(rental_rate) FROM film;
// SELECT DISTINCT(rating) FROM film;
// SELECT * FROM payment;
// SELECT COUNT(*) FROM payment;
// SELECT COUNT(DISTINCT amount) FROM payment;
// SELECT * FROM customer;
// SELECT first_name, last_name FROM customer WHERE activebool = true;
// SELECT * FROM customer;
// SELECT first_name, last_name FROM customer WHERE store_id = 1;
// SELECT * FROM film WHERE rental_rate > 4;
// SELECT COUNT(*) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';
// SELECT COUNT(*) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 OR rating = 'R';
// SELECT email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas';
// SELECT description FROM film WHERE title = 'Outlaw Hanky';
// SELECT * FROM customer;
// SELECT phone FROM address WHERE address = '259 Ipoh Drive';
// SELECT * FROM customer ORDER BY first_name ASC;
// SELECT * FROM customer ORDER BY first_name DESC;
// SELECT * FROM customer ORDER BY store_id, first_name ASC;
// SELECT store_id, first_name, last_name FROM customer ORDER BY store_id, first_name ASC, last_name DESC;
// SELECT * FROM payment;
// SELECT * FROM payment ORDER BY payment_date;
// SELECT * FROM payment ORDER BY payment_date LIMIT 10;
// SELECT * FROM payment WHERE amount != 0 ORDER BY payment_date LIMIT 10;
// SELECT customer_id FROM payment ORDER BY payment_date LIMIT 10;
// SELECT title FROM film ORDER BY length ASC LIMIT 5;
// SELECT * FROM customer;
// SELECT * FROM payment ORDER BY payment_date LIMIT 10;
// SELECT COUNT(title) FROM film WHERE length <= 50;
// SELECT * FROM payment;
// SELECT * FROM payment WHERE amount BETWEEN 8 AND 9;
// SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';
// SELECT DISTINCT(amount) FROM payment WHERE amount BETWEEN 8 AND 9;
// SELECT * FROM payment WHERE amount IN(0.99, 1.98, 1.99);
// SELECT COUNT(*) FROM payment WHERE amount NOT IN(0.99, 1.98, 1.99);
// SELECT * FROM customer WHERE first_name IN('John', 'Jake', 'Julie');
// SELECT * FROM customer WHERE first_name LIKE 'J%';
// SELECT * FROM customer WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';
// SELECT * FROM customer WHERE first_name LIKE '%er%';
// SELECT * FROM customer WHERE first_name LIKE '_er%';
// SELECT * FROM customer WHERE first_name NOT LIKE '%er%';
// SELECT * FROM customer WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%' ORDER BY last_name;
// SELECT COUNT(amount) FROM payment WHERE amount > 5.00;
// SELECT * FROM payment WHERE amount > 5.00;
// SELECT COUNT(first_name) FROM actor WHERE first_name LIKE 'P%';
// SELECT * FROM customer;
// SELECT COUNT(DISTINCT(district)) FROM address;
// SELECT * FROM address;
// SELECT DISTINCT(district) FROM address;
// SELECT COUNT(*) FROM film WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;
// SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%';


// SELECT * FROM film;
// SELECT MIN(replacement_cost) FROM film;
// SELECT MAX(replacement_cost) FROM film;
// SELECT MIN(replacement_cost), MAX(replacement_cost) FROM film;
// SELECT AVG(replacement_cost) FROM film;
// SELECT ROUND(AVG(replacement_cost), 2) FROM film;
// SELECT SUM(replacement_cost) FROM film;
// SELECT * FROM payment;
// SELECT customer_id FROM payment GROUP BY customer_id;
// SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount)DESC;
// SELECT customer_id, COUNT(amount) FROM payment GROUP BY customer_id ORDER BY COUNT(amount)DESC;
// SELECT customer_id, staff_id, SUM(amount) FROM payment GROUP BY staff_id, customer_id ORDER BY customer_id;
// SELECT DATE(payment_date) FROM payment;
// SELECT DATE(payment_date), SUM(amount) FROM payment GROUP BY DATE(payment_date) ORDER BY SUM(amount) DESC;
// SELECT staff_id, COUNT(amount) FROM payment GROUP BY staff_id;
// SELECT rating, ROUND(AVG(replacement_cost), 2) FROM film GROUP BY rating;
// SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 5;
// SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id HAVING SUM(amount) > 100;
// SELECT store_id, COUNT(customer_id) FROM customer GROUP BY store_id;
// SELECT store_id, COUNT(customer_id) FROM customer GROUP BY store_id HAVING COUNT(*) > 300;
// SELECT customer_id, COUNT(payment_date) FROM payment GROUP BY customer_id HAVING COUNT(payment_date) >= 40;
// SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id, staff_id HAVING SUM(amount) > 100 AND staff_id = 2;
// SELECT customer_id, SUM(amount) FROM payment WHERE staff_id = 2 GROUP BY customer_id HAVING SUM(amount) > 100;

// SELECT customer_id, SUM(amount) FROM payment WHERE staff_id = 2 GROUP BY customer_id HAVING SUM(amount) > 110;
// SELECT COUNT(*) FROM film WHERE title LIKE 'J%';
// SELECT first_name, last_name FROM customer WHERE first_name LIKE 'E%' AND address_id < 500 ORDER BY customer_id DESC LIMIT 1;

// SELECT * FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id;
// SELECT payment_id, payment.customer_id, first_name FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id;

// SELECT * FROM customer FULL OUTER JOIN payment ON customer.customer_id = payment.customer_id;
// SELECT * FROM customer FULL OUTER JOIN payment ON customer.customer_id = payment.customer_id WHERE customer.customer_id IS null OR payment.payment_id IS null;

// SELECT film.film_id, film.title, inventory_id FROM film LEFT OUTER JOIN inventory ON inventory.film_id = film.film_id;
// SELECT film.film_id, film.title, inventory_id FROM film LEFT OUTER JOIN inventory ON inventory.film_id = film.film_id WHERE inventory.film_id IS null;


//Below is the rest of the class.



