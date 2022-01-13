1. Select all fields, and all records from actor table
=> select * from actor;

2.Select all fields and records from film table
=> select * from film;

3.Select all fields and records from the staff table
=> select * from staff;

4. Select address and district columns from address table
=> select address, district from address;

5. Select title and description from film table
=> select title, description from film;

6. Select city and country_id from city table
=> select city,country_id from city;

7. Select all the distinct last names from customer table
=> select DISTINCT last_name from customer;

8. Select all the distinct first names from the actor table
=> select DISTINCT first_name from actor;

9. Select all the distinct inventory_id values from rental table
=> select DISTINCT inventory_id from rental;

10. Find the number of films ( COUNT ).
=> select COUNT(*) from film;

11. Find the number of categories.
=> select COUNT(*) from category;

12. Find the number of distinct first names in actor table
=> select DISTINCT first_name from actor;

13. Select rental_id and the difference between return_date and rental_date in rental table.
=> select rental_id,return_date,rental_date from rental;

-------------------------------------------------------------------------------------------------------
-- select * from actor;
--select * from film;
-- select * from staff;
-- select address, district from address;
-- select title, description from film;
-- select city,country_id from city;
--select DISTINCT last_name from customer;
--select DISTINCT first_name from actor;
-- select DISTINCT inventory_id from rental;
--select COUNT(*) from film;
-- select COUNT(*) from category;
--select DISTINCT first_name from actor;
--select rental_id,return_date,rental_date from rental;
