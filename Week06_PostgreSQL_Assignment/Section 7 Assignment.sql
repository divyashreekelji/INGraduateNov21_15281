------------------------------Assignment------------------------------------
1. Return the name, weight, and productnumber of  all the products  ordered by weight from lightest to heaviest. 
 (Remember to use schema to reach table.  It is in production schema.)
=> Select name,weight,productnumber FROM production.product Order By weight;

2. Return the records from productvendor for productid = 407 in order of averageleadtime from shortest to longest.
 (You'll have to figure out which schema this is in.)
=> select * from purchasing.productvendor WHERE productid = 407 order by averageleadtime ASC;

3. Find all the salesorderdetail records for productid 799 and order them by largest orderqty to smallest.
=> select * from sales.salesorderdetail WHERE productid=799 Order By orderqty DESC;

4 What is the largest  discount percentage offered in the specialoffer table.
=> Select MAX(discountpct) From sales.specialoffer;

5. Find the smallest number of sickleavehours for an employee.
=> Select MIN(sickleavehours) From humanresources.employee;

6. Find the largest rejected quantity in the purchaseorderdetail table.
=> Select MAX(rejectedqty) From purchasing.purchaseorderdetail;

7. Find the average rate from employeepayhistory table.
=> Select AVG(rate) From humanresources.employeepayhistory;

8. Find the average standardcost in the productcosthistory table for productid 738.
=> Select AVG(standardcost) FROM production.productcosthistory WHERE productid=738;

9. Find the sum of scrappedqty from the workorder table for productid 529.
=> Select SUM(scrappedqty) FROM production.workorder WHERE productid = 529;

10. Find all vendor names with a name that starts with letter G.
=> Select name FROM purchasing.vendor WHERE name LIKE 'G%';

11. Find all vendor names that have the word Bike in them.
=> Select name FROM purchasing.vendor WHERE name LIKE '%Bike%';

12. Search the person table for every firstname that has t as a second letter.
=> Select firstname FROM person.person WHERE firstname LIKE '_t%';

13. Return the first 20 records from emailaddress table.
=> Select * FROM person.emailaddress LIMIT 20;

14. Return the first 2 records from productcategory table.
=> Select * FROM production.productcategory LIMIT 2;

15. How many product records have a missing weight value.
=> Select COUNT(*) FROM production.product WHERE weight IS NULL;

16. How many person records have an additionalcontactinfo field that has a value.
=> Select COUNT(*) FROM person.person WHERE additionalcontactinfo IS NOT NULL;

-------------------------------------------------------------------------------------------

(Udemy)
Section 7:
1) Order by
--select DISTINCT(country) from suppliers order by country ASC;
--select productname,unitprice FROM products order by unitprice , productname ;

2) Min and Max
--SELECT MIN(orderdate) FROM orders WHERE shipcountry='Italy';
--SELECT MAX(orderdate) FROM orders WHERE shipcountry='Italy';
--select MIN(shippeddate - orderdate) FROM orders WHERE shipcountry='France';

3)AVG and SUM
-- select AVG(freight) FROM orders WHERE shipcountry='Brazil';
-- select AVG(quantity) from order_details WHERE productid=35;
--select SUM(quantity) FROM order_details where productid=14;
--select AVG(quantity) from order_details WHERE productid=35;

4)LIKE
--select companyname from suppliers where companyname LIKE '_or%';
--select companyname from customers where companyname LIKE '%er';

5)Renaming columns with alias:
--SELECT unitprice*quantity as TOTAlSPENT FROM order_details;

6)Alias
--SELECT unitprice * quantity as TotalSpent FROM order_details Order by TotalSpent DESC;

--select productid,unitprice AS TotalCost
-- FROM order_details
-- Order by TotalCost DESC
-- LIMIT 3;

-- Select productname,unitprice*unitsinstock AS TotalInventory 
-- from products
-- order by TotalInventory ASC
-- LIMIT 1;

7)NULL values:
--select COUNT(*) FROM Customers WHERE region IS NULL;

-- select COUNT(*) FROM Customers WHERE region IS NOT NULL;

--COUNT(*) From orders where shipregion IS NULL;
