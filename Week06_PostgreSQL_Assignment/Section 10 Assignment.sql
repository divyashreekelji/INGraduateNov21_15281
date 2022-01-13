//UNIONS
1) Get a list of all customer and supplier company names.
=>
SELECT companyname
FROM customers
UNION
SELECT companyname
FROM suppliers;

//UNION ALL
2) Find all our customers and suppliers, with one record for each companies city
=>
SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers;

3)Find Distinct countries of all our customers and suppliers in alphabetical order.
=>
SELECT country
FROM customers
UNION
SELECT country
FROM suppliers
ORDER BY country ASC;

4)All list of countries of our suppliers and customers, with a record for each one.
=>
SELECT country
FROM customers
UNION ALL
SELECT country
FROM suppliers
ORDER BY country ASC;

---------------------INTERSECT--------------
5) Find all countries that we have both customers and suppliers in.
=>
SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers;

// INTERSECT ALL
6) Find the number of customer and supplier pairs that are in the same country.
=>
SELECT COUNT(*) FROM
(SELECT country FROM customers
INTERSECT ALL
SELECT country FROM suppliers) AS same_country;

7) Distinct cities that we have a supplier and customer located in.
=>
SELECT city
FROM customers
INTERSECT
SELECT city
FROM suppliers
ORDER BY country ASC;

8) The count of the number of customers and suppliers pairs that are in the same city.
=>
SELECT COUNT(*) FROM
(SELECT city FROM customers
INTERSECT
SELECT city FROM suppliers ) AS same_city;

-------------------------//subquery using EXIST------------------------
9)Find all countries that we customers in but no suppliers.
=>
SELECT country FROM customers
EXCEPT
SELECT country FROM suppliers;

//EXCEPT ALL
10)Find the number of customer that are in a country without suppliers.
=>
SELECT COUNT(*) FROM
(SELECT country FROM customers
EXCEPT ALL
SELECT country FROM suppliers) AS same_country;

11)Cities we have a supplier with no customer.
=>
SELECT city FROM suppliers
EXCEPT
SELECT city FROM customers;

12)How many customers do we have in cities without suppliers?
=>
SELECT COUNT(*) FROM
(SELECT city FROM customers
INTERSECT
SELECT city FROM suppliers ) AS same_city;



