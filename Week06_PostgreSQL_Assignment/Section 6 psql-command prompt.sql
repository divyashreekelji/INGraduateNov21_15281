 // COMMAND PROMPT
Step 1: path = C:\Program Files\PostgreSQL\14\bin
Step 2: psql --port=5432 --host=localhost --dbname=northwind --username=postgres
Step 3: select * from orders;
step 4: To exit \q


1) To change database : psql -d AdventureWorks   

2)northwind=# \l  - List of databases

3)northwind=# \!clear 

4)northwind-# \c AdventureWorks   (Change database)

You are now connected to database "AdventureWorks" as user "postgres".
AdventureWorks-#

5)AdventureWorks=# \dn           (List of Schemas)
      List of schemas
      Name      |  Owner
----------------+----------
 hr             | postgres
 humanresources | postgres
 pe             | postgres
 person         | postgres
 pr             | postgres
 production     | postgres
 pu             | postgres
 public         | postgres
 purchasing     | postgres
 sa             | postgres
 sales          | postgres
(11 rows)

6)AdventureWorks=# \dt sales. (List of relations)     

7) AdventureWorks=# select * From sales.store LIMIT 1;

 businessentityid |         name         | salespersonid |                                                                                                                                                                                                           demographics                                                                                                                                                                                                           |               rowguid                |      modifieddate
------------------+----------------------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------+-------------------------
              292 | Next-Door Bike Store |           279 | <StoreSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"><AnnualSales>800000</AnnualSales><AnnualRevenue>80000</AnnualRevenue><BankName>United Security</BankName><BusinessType>BM</BusinessType><YearOpened>1996</YearOpened><Specialty>Mountain</Specialty><SquareFeet>21000</SquareFeet><Brands>2</Brands><Internet>ISDN</Internet><NumberEmployees>13</NumberEmployees></StoreSurvey> | a22517e3-848d-4ebe-b9d9-7437f3432304 | 2014-09-12 11:15:07.497
(1 row)


AdventureWorks=#

