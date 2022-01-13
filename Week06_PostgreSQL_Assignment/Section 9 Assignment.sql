//GROUP BY
1) How many Customers do we have in each country?
=> select country, COUNT(*) from customers GROUP BY Country Order by COUNT(*) DESC;

2) What is the number of products for each category?
=>Select Categoryname,COUNT(*) From categories JOIN products ON products.categoryid=categories.categoryid GROUP BY categoryname ORDER BY COUNT(*) DESC;

3) What is the average number of items order for product order by the average amount?
=> SELECT productname,ROUND(AVG(quantity))
from products
JOIN order_details ON products.productid=order_details.productid
GROUP BY productname ORDER BY AVG(quantity) DESC;

4) How many suppliers in each country?
=>SELECT productname,ROUND(AVG(quantity))
from products
JOIN order_details ON products.productid=order_details.productid
GROUP BY productname ORDER BY AVG(quantity) DESC;

// Filter Group

5)Total value for each product sold for year of 1997?
=>
SELECT productname, SUM(order_details.unitprice * quantity)
From products
JOIN Order_details ON products.productid=order_details.productid
JOIN orders ON orders.orderid=order_details.orderid
WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY productname
ORDER BY SUM(order_details.unitprice*quantity) DESC

6) Find products that sold less than $2000?
=>
SELECT productname, SUM(quantity*order_details.unitprice) AS Amount
From products
JOIN order_details USING (productid)
GROUP BY productname
Having SUM(quantity * order_details.unitprice)<2000
Order By Amount ASC;

7) How many customers that have bought more than $5000 of products?
=>
SELECT companyname, SUM(quantity * order_details.unitprice) AS Amount
from customers
NATURAL JOIN orders
NATURAL JOIN order_details
GROUP BY companyname
HAVING SUM(quantity * order_details.unitprice)>5000
ORDER BY Amount DESC;

8) Customers have bought more than $5000 of products with order date in first six months of year of 1997?
=>

SELECT companyname, SUM(quantity * order_details.unitprice) AS AmountBought
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details
WHERE orderdate BETWEEN '1997-01-01' AND '1997-6-30'
GROUP BY companyname
HAVING SUM(quantity * order_details.unitprice) >5000
ORDER BY AmountBought DESC;

//GROUPING SET
9)The sales grouped by product and category?
=>
SELECT categoryname,productname,SUM(od.unitprice*quantity)
FROM categories
NATURAL JOIN products
NATURAL JOIN order_details AS od
GROUP BY GROUPING SETS  ((categoryname),(categoryname,productname))
ORDER BY categoryname, productname;

10) Find total sales by both customers companyname renamed as buyer and suppliers companyname renamed as supplier and order by buyer and order by buyer and supplier.
=>
SELECT c.companyname AS buyer,s.companyname AS supplier,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN suppliers  AS s USING (supplierid)
GROUP BY GROUPING SETS ((buyer),(buyer,supplier))
ORDER BY buyer,supplier;

11) Find total sales grouped by customer companyname and categoryname(must link to tables), order by companyname, categoryname with NULL First.
=>
SELECT companyname,categoryname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories  AS s USING (categoryid)
GROUP BY GROUPING SETS ((companyname),(companyname,categoryname))
ORDER BY companyname,categoryname NULLS FIRST;

//ROLLUP
12)Rollup with customer, categories and product.
=>
SELECT c.companyname,categoryname,productname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories  USING (categoryid)
GROUP BY ROLLUP(companyname, categoryname, productname)
ORDER BY companyname,categoryname,productname;

13)Roolup of suppliers,products, customers
=>
SELECT s.companyname AS supplier, c.companyname AS buyer,productname, SUM(od.unitprice*quantity)
FROM suppliers AS s
JOIN products USING (supplierid)
JOIN order_details AS od USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY ROLLUP(supplier, buyer, productname)
ORDER BY supplier,buyer,productname;

//// ROllup on steroids/CUBE
14)Cube of total sales by customer,categories and products.
=>
SELECT c.companyname,categoryname,productname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories  USING (categoryid)
GROUP BY CUBE (companyname, categoryname, productname);

15)Cube of total sales by supplier, products and customers.
=>
SELECT s.companyname AS supplier, c.companyname AS buyer,productname, SUM(od.unitprice*quantity)
FROM suppliers AS s
JOIN products USING (supplierid)
JOIN order_details AS od USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY CUBE(supplier, buyer, productname);
