//INSERT INTO
1) Create a new order for customer 'VINET'.
=>
INSERT INTO orders
(customerid, employeeid, orderdate, requireddate, shipvia,
 freight, shipname, shipaddress, shipcity, shippostalcode,shipcountry)
VALUES ('VINET', 4, '2017-09-16','2017-09-30',3,
        42.5, 'Vins et alcools Chevalier',
        '59 rue de l''Abbaye', 'Reims','51100', 'France');

2) Insert an order detail for order we just created. Make it an quantity of20 of Queso Cabrels (you will have to look up id) with a price of $14.
=>
-----check product with  name is Queso cabrels.---------
SELECT *
FROM PRODUCTS
WHERE productname='Queso Cabrales'
productid=11;

INSERT INTO order_details
(orderid, productid, unitprice,quantity,discount)
VALUES (11078,11,14,20,0);

//UPDATE
3)They need it by 2017-09-20 (10 days earlier), and the shipping cost will increase to $50?
=>
UPDATE orders
SET requireddate='2017-09-20',freight=50
WHERE orderid=11078;

4)They also want 40 Queso Cabrales insted of 20 and we are giving a discount of .05.
Trick is the WHERE clause to make sure we update the right order details since there is no order detail id field.
=>
UPDATE order_details
SET quantity=40,discount=.05
WHERE orderid=11078 AND productid=11;

//DELETE
5)They cancel the oder, so let's first delete the order_detail.
=>
DELETE FROM order_details
WHERE orderid=11078 AND productid=11;

6)Delete the order for the customer using the order id.
=>
DELETE FROM orders
WHERE orderid=11078;

// SELECT INTO
7) SELECT backup all our suppliers in North America.
=>
SELECT *
INTO suppliers_northamerica
FROM suppliers
WHERE country in ('USA','Canada');

8)Backup orders in the year 1997 to a new table orders_1997?
=>
SELECT *
INTO orders_1997
FROM orders
WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31';

//INSERT INTO SELECT SYNTAX
9)Add our suppliers in Brazil and Argentina to suppliers_northamerica.
=>
INSERT INTO suppliers_northamerica
SELECT *
FROM suppliers
WHERE country IN ('Brazil','Argentina')

10)Add orders from December 2016 to table orders_1997?
=>
INSERT INTO orders_1997
SELECT * FROM orders
WHERE orderdate BETWEEN '1996-12-01' AND '1996-12-31'


//Returning data from Update, DELETE and INSERT
11) Insert a new employee returning the employeeid.
=>
INSERT INTO employees
(firstname,lastname,address,city,country,postalcode,homephone,title,employeeid,reportsto)
VALUES
('Bob','Smith','463-4613 Ipsum Street','New Orleans','USA','73-638','741-0423','Chief Strategy',50,NULL)
RETURNING employeeid;

12) Insert an new  order into table(I would use orderid=500) and return the orderid.
=>
INSERT INTO orders (customerid,employeeid,requireddate,shippeddate,orderid)
VALUES ('VINET',5,'1996-08-01','1996-08-10',500) 
RETURNING orderid;

13)Increase the unit price of Chai (productid=1) by 20% and return the new price and productid.
=>
UPDATE products
SET unitprice = unitprice * 1.2
WHERE productid=1
RETURNING productid,unitprice AS new_price;

14)Update order_details for orderid 10248 and productid 11 to double the quantity orderid and return the new quantity.
=>
UPDATE order_details
SET quantity = quantity * 2
WHERE orderid=10248 AND productid=11
RETURNING quantity AS new_quantity;

15)Delete the employee we just entered (employeeid=50) and return all the rows.
=>
DELETE FROM employees
WHERE employeeid=50
RETURNING *;

16)Delete the order you entered (orderid=500) earlier and return all fields.
=>
DELETE FROM orders
WHERE orderid=500
RETURNING *;
