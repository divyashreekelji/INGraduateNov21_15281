// Indexes and performance tuning
//CREATE INDEX
1)
=>
CREATE UNIQUE INDEX idx_employees_employeeid
ON employees (employeeid);

2)
=>
CREATE INDEX idx_orders_customerid_orderid
ON orders (customerid, orderid);

//DROP INDEX 
3) The idx_employees_employeeid index on employees table.
=> DROP INDEX idx_employees_employeeid;

4)DROP idx_orders_customerid_orderid index on orders table.
=> DROP INDEX idx_orders_customerid_orderid;

//Qyery plan cost calculated
5) size of table
SELECT pg_relation_size('performance_test'),
  pg_size_pretty(pg_relation_size('performance_test'));

6) number of relation pages
=>
SELECT relpages
FROM pg_class
WHERE relname='performance_test';

7)
SELECT relpages, pg_relation_size('performance_test') / 8192
FROM pg_class
WHERE relname='performance_test';

8) I/O cost per relationship page read
=>
SHOW seq_page_cost;

9) total I/O cost
SELECT relpages * current_setting('seq_page_cost')::numeric
FROM pg_class
WHERE relname='performance_test';

10) number of rows
SELECT reltuples
FROM pg_class
WHERE relname='performance_test';

11)CPU cost per row processed
SHOW cpu_tuple_cost;
SHOW cpu_operator_cost;

12)Total CPU Costs
SELECT reltuples * current_setting('cpu_tuple_cost')::numeric +
reltuples * current_setting('cpu_operator_cost')::numeric
FROM pg_class
WHERE relname='performance_test';

13) Total Costs for a table scan
SELECT relpages * current_setting('seq_page_cost')::numeric +
reltuples * current_setting('cpu_tuple_cost')::numeric +
reltuples * current_setting('cpu_operator_cost')::numeric
FROM pg_class
WHERE relname='performance_test';

//Using Indexes on More than one field.
14)
=>
ALTER TABLE performance_test
ADD COLUMN name text;

UPDATE performance_test
SET name = md5(location);

15)-- takes above 900ms after data cached
EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE location LIKE 'df%' AND name LIKE 'cf%';

CREATE INDEX idx_peformance_test_location_name
ON performance_test(location,name);

16)-- takes 55 ms
EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE location LIKE 'df%' AND name LIKE 'cf%';

17)-- this can't use index
EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE  name LIKE 'cf%';

18)-- this can
EXPLAIN ANALYZE SELECT *
FROM  performance_test
WHERE location LIKE 'df%';

-----------------------------------------------------------------------------------
//EXPRESSION INDEXES:
-- This is for AdventureWorks database

--Make sure we don't have indexes to see the effect
19)
=>DROP INDEX IF EXISTS production.idx_product_name;

20)
=>
DROP INDEX IF EXISTS production.idx_product_upper_name;

21)
-- you should see a sequential scan
-- "Seq Scan on product  (cost=0.00..17.56 rows=3 width=139)"
EXPLAIN select *
from production.product
WHERE name LIKE 'Flat%';

22) create normal index
CREATE INDEX idx_product_name
ON production.product (name);

23) this becomes an bitmap index scan
-- "  ->  Bitmap Index Scan on idx_product_name  (cost=0.00..4.32 rows=5 width=0)"
EXPLAIN select *
from production.product
WHERE name LIKE 'Flat%';

24) this is back to sequential scan
-- "Seq Scan on product  (cost=0.00..17.56 rows=3 width=139)"
EXPLAIN select *
from production.product
WHERE UPPER(NAME) LIKE UPPER('Flat%');

25) create an expression scan
=>
CREATE INDEX idx_product_upper_name
ON production.product (UPPER(name));

26) now we get a bitmap index scan
-- "  ->  Bitmap Index Scan on idx_product_upper_name  (cost=0.00..4.30 rows=3 width=0)"
=>
EXPLAIN select *
from production.product
WHERE UPPER(NAME) LIKE UPPER('Flat%');

27) Build an index for person.person table that combines their first name with last name with last name using string concatenation ||. Be sure to put a space between the names. If you were to select the fields it would look like this.
=>
CREATE INDEX idx_person_fullname
ON person.person ( (firstname  || ' ' || lastname) );

28)show that it uses the index
=>
EXPLAIN SELECT *
FROM person.person
WHERE firstname || ' ' || lastname = 'Terri Duffy';
--------------------------------------------------------------------------
//Speeding Up Text Matching
29)
=>
CREATE EXTENSION pg_trgm;  (index 1)

CREATE INDEX trgm_idx_performance_test_location
ON performance_test USING gin (location gin_trgm_ops);   (index 2)

CREATE INDEX idx_performance_test_name
ON performance_test (name);


30) terrible performance
=>
EXPLAIN ANALYZE SELECT location
FROM  performance_test
WHERE name LIKE '%dfe%';

31)only situation where pattern matching works
=>
EXPLAIN ANALYZE SELECT location
FROM  performance_test
WHERE name LIKE 'dfe%';

32)much better performance
=>
EXPLAIN ANALYZE SELECT location
FROM  performance_test
WHERE location LIKE '%dfe%';


