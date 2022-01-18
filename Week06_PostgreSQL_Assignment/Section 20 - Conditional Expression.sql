//CASE WHEN
1)We want to return company name, country and continent our customers are from
=>
SELECT companyname,country,
CASE WHEN country IN ('Austria','Germany','Poland','France','Sweden','Italy','Spain',
             'UK','Ireland','Belgium','Finland','Norway','Portugal','Switzerland') THEN 'Europe'
             WHEN country IN ('Canada','Mexico','USA') THEN 'North America'
             WHEN country IN ('Argentina','Brazil','Venezuela') THEN 'South America'
             ELSE country
END AS continent
FROM customers;

2)A list of product names,unit price and label corresponding to inexpensive if unit price is below $10, mid-range if price $10 up to $50 and expensive if over $50?
=> 
SELECT productname,unitprice,
CASE WHEN unitprice<10 THEN 'inexpensive'
     WHEN unitprice>=10 AND unitprice<=50 THEN 'mid-range'
	 WHEN unitprice > 50 THEN 'premium'
END AS quality
FROM products;

3) CASE field WHEN value THEN Result:
=>
SELECT companyname,city,
CASE city WHEN 'New Orleans' THEN 'Big Easy'
                   WHEN 'Paris' THEN 'City of Lights'
	         ELSE 'Needs nickname'
END as nickname
FROM suppliers;

4)
SELECT orderid,customerid,
CASE date_part('year', orderdate)
	WHEN 1996 THEN 'year1'
	WHEN 1997 THEN 'year2'
	WHEN 1998 THEN 'year3'
END
FROM orders;


//COALESCE
5)Return 'N/A' (not applicable) for regn from orders when field is null?
=> 
SELECT customerid,COALESCE(shipregion,'N/A') FROM orders;

6) Return a list of supplier's company name and home page. If home page is missing in put is "Call to find" for field.
=>
SELECT companyname,COALESCE(homepage,'Call to find') from suppliers;


//NULLIF
 used to return a null if two values are equal. Used to trigger a null in COALESCE so next value is used.
7)
=>
UPDATE suppliers
SET homepage = ''
WHERE homepage IS NULL;

UPDATE customers
SET fax = ''
WHERE fax IS NULL;

8)Need a confirmation list of customers. Return fax number if available or phone as secondary option.
=>
SELECT companyname,phone,
COALESCE(NULLIF(homepage,''),'Need to call')
FROM suppliers;

SELECT companyname,
COALESCE(NULLIF(fax,''),phone) AS confirmation
FROM customers;
