--------------Assignment:--------------------------------------------------
(Open the AdventureWorks database and get a query window for that database. )
1. Join (with inner join) together person, personphone, businessentity and phonenumber type in the persons schema. 
 Return first name, middle name, last name, phone number and the name of the phone number type (home, office, etc.) 
 Order by business entity id descending.
=> 
-- this is spelling out the ON
SELECT firstname,middlename,lastname,phonenumber,name
FROM person.personphone AS ph
JOIN person.businessentity AS be ON be.businessentityid=ph.businessentityid
JOIN person.person AS pe ON pe.businessentityid=be.businessentityid
JOIN person.phonenumbertype AS pnt ON pnt.phonenumbertypeid=ph.phonenumbertypeid
ORDER BY ph.businessentityid DESC;

--this is with USING
SELECT firstname,middlename,lastname,phonenumber,name
FROM person.personphone AS ph
JOIN person.businessentity USING (businessentityid)
JOIN person.person USING (businessentityid)
JOIN person.phonenumbertype USING (phonenumbertypeid)
ORDER BY ph.businessentityid DESC;

2. Join (Inner) productmodel, productmodelproductiondescriptionculture, productdescription and culture from the production schema.  Return the productmodel name, culture name, and productdescription description ordered by the product model name.
=> 
SELECT pm.name,c.name,description
FROM production.productdescription
JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
JOIN production.culture AS c USING (cultureid)
JOIN production.productmodel AS pm USING (productmodelid)
ORDER BY pm.name ASC;

3. Add a join to previous example to production.product and return the product name field in addition to other information.
=> 
SELECT p.name,pm.name,c.name,description
FROM production.productdescription
JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
JOIN production.culture AS c USING (cultureid)
JOIN production.productmodel AS pm USING (productmodelid)
JOIN production.product AS p USING (productmodelid)
ORDER BY pm.name ASC;

4. Join product and productreview in the schema table.  Include every record from product and any reviews they have.  Return the product name, review rating and comments.  Order by rating in ascending order.
=> 
SELECT name, rating, comments
FROM production.product
LEFT JOIN production.productreview USING (productid)
ORDER BY rating ASC;

5. Use a right join to combine workorder and product from production schema to bring back all products and any work orders they have.  
Include the product name and workorder orderqty and scrappedqty fields. Order by productid ascending.
=> 
SELECT p.name,orderqty,scrappedqty
FROM production.workorder
RIGHT JOIN production.product AS p USING (productid)
ORDER BY p.productid ASC;


----------------------------------------------------------------------------------Udemy-------------------------------------------------------------------------------
//Grabing information from two tables:
1)A report that gives customername, outerdate and shipcountry.
=>
SELECT companyname,orderdate,shipcountry
FROM orders
JOIN customers ON customers.customerid=orders.customerid;

2)Connect Employees to orders and pull back first name, last name and order date for all orders.
=> 
SELECT firstname,lastname,orderdate
FROM orders
JOIN employees ON employees.employeeid=orders.employeeid;

3)Connect products to suppliers and pull back company name, unit cost and units in stock.
=>
SELECT companyname,unitprice,unitsinstock
FROM products
JOIN suppliers ON products.supplierid=suppliers.supplierid;

//Grabing information from Multiple Tbles

4)Bring back company name,order date, productid, unit price and quantity.
=>
SELECT companyname,orderdate,unitprice,quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid;

5)Connect products to previous query and add product name to fields returned.
=>
SELECT companyname, productname, orderdate, order_details.unitprice, quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid
JOIN products ON products.productid=order_details.productid;

6) Connect categories to previous query and bring back category name.
=>
SELECT companyname, productname, categoryname,
	     Orderdate, order_details.unitprice, quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid
JOIN products ON products.productid=order_details.productid
JOIN categories ON categories.categoryid=products.categoryid;

7)using previous (6) query and add a WHERE clause that select category name of Seafood and amount spent>=500
=>
SELECT companyname, productname, categoryname, orderdate, order_details.unitprice, quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid
JOIN products ON products.productid=order_details.productid
JOIN categories ON categories.categoryid=products.categoryid
WHERE 	categoryname='Seafood' AND
order_details.unitprice*quantity >= 500;

//Left Join
8) Bring back company name and order id.
=>
SELECT companyname, orderid
FROM customers
LEFT JOIN orders ON customers.customerid=orders.customerid;

9)Left join between products and order_details.
=>
SELECT productname, orderid
FROM products
LEFT JOIN order_details ON products.productid=order_details.productid;

10) Use IS NULL to find products without orders.
=>
SELECT productname, orderid
FROM products
LEFT JOIN order_details ON products.productid=order_details.productid
WHERE orderid IS NULL;

// Right Joins
11)Bring back company name and order id, using reverse table order from last lesson.
=>
SELECT companyname, orderid
FROM orders
RIGHT JOIN customers ON customers.customerid=orders.customerid;

12)Bring back company name and order id, using reverse table order from last lesson.
Use WHERE with IS NULL.
=>
SELECT companyname, orderid
FROM orders
RIGHT JOIN customers ON customers.customerid=orders.customerid
WHERE orderid IS NULL;

13)Do a right join between customer demo and customers.
=>
SELECT companyname, customercustomerdemo.customerid
FROM customercustomerdemo
RIGHT JOIN customers ON customers.customerid=customercustomerdemo.customerid;

//Full Joins
14) Display company name and order id.
=>
SELECT companyname, orderid
FROM orders
FULL JOIN customers ON customers.customerid=orders.customerid;

15) Full join between products and categories.
=>
SELECT productname, categoryname
FROM categories
FULL JOIN products ON products.categoryid=categories.categoryid;

// Self Join
16)Who are in same city and order by city.
=>
SELECT A.companyname AS CustomerName1, 
B.companyname AS CustomerName2, A.city
FROM customers A, customers B
WHERE A.customerid > B.customerid
AND A.city = B.city
ORDER BY A.city;

17)Find suppliers from same country and order by country.
=>
SELECT  A.companyname AS SupplierName1,
		B.companyname AS SupplierName2,  A.country
FROM suppliers A, suppliers B
WHERE A.supplierid > B.supplierid
AND A.country = B.country
ORDER BY A.country;

//Using to reduce Typing
18)Join Orders to order_details with USING
=>
SELECT *
FROM orders
JOIN order_details USING (orderid);

19)Add products to the previous join of orders and order_details.
=>
SELECT *
FROM orders
JOIN order_details USING (orderid)
JOIN products USING (productid);

// Less typing with NATURAL
20)Join order and order_details using NATURAL.
=>
SELECT *
FROM orders
NATURAL JOIN order_details;

21)Add customers to previous query using NATURAL join.
(Warning : You must order the joins correctly. The NATURAL must connect previous table to next table or
 it will do a cross join connecting every row to every other row)
=>
SELECT *
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details;


---------------------------------------------------------------------
