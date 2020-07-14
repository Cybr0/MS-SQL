-- 1

SELECT *
FROM orders
WHERE salesman_id =
    (SELECT salesman_id 
     FROM salesman 
     WHERE name='Paul Adam');

--2

SELECT *
FROM orders
WHERE salesman_id =
    (SELECT salesman_id 
     FROM salesman 
     WHERE city='London');

--2.1

SELECT * FROM ORDERS AS O
JOIN Salesman AS S
ON S.salesman_id = O.salesman_id
WHERE S.CITY = 'London';

--3

SELECT * 
FROM ORDERS AS O
WHERE O.salesman_id = 
    (
     SELECT DISTINCT SALESMAN_ID
FROM ORDERS
WHERE CUSTOMER_ID = 3007
    );

--4

SELECT *
FROM orders
WHERE purch_amt >
    (SELECT  AVG(purch_amt) 
     FROM orders 
     WHERE ord_date ='10/10/2012');

--5

SELECT *
FROM orders
WHERE salesman_id IN
    (SELECT salesman_id 
     FROM salesman 
     WHERE city ='New York');

--6

SELECT commission
FROM salesman
WHERE salesman_id IN
    (SELECT salesman_id 
     FROM customer
     WHERE city = 'Paris');

--7

SELECT *
FROM customer
WHERE customer_id =
    (SELECT salesman_id -2001
     FROM salesman
     WHERE name = 'Mc Lyon');

--8

SELECT grade, COUNT (*)
FROM customer
GROUP BY grade
HAVING grade >
    (SELECT AVG(grade)
     FROM customer
     WHERE city = 'New York');

--9

SELECT ord_no, purch_amt, ord_date, salesman_id 
FROM orders 
WHERE salesman_id IN(
SELECT salesman_id 
FROM salesman
WHERE commission = (
SELECT MAX(commission) 
FROM salesman));

--10

SELECT b.*, a.cust_name
FROM orders b, customer a
WHERE a.customer_id=b.customer_id
AND b.ord_date='2012-08-17';

--11

SELECT salesman_id,name 
FROM salesman a 
WHERE 1 < 
    (SELECT COUNT(*) 
     FROM customer 
     WHERE salesman_id=a.salesman_id);

--12

SELECT * 
FROM orders a
WHERE purch_amt >
    (SELECT AVG(purch_amt) FROM orders b 
     WHERE b.customer_id = a.customer_id);

--13

SELECT * 
FROM orders a
WHERE purch_amt >=
    (SELECT AVG(purch_amt) FROM orders b 
     WHERE b.customer_id = a.customer_id);

--14

SELECT ord_date, SUM (purch_amt)
FROM orders a
GROUP BY ord_date
HAVING SUM (purch_amt) >
    (SELECT 1000.00 + MAX(purch_amt) 
     FROM orders b 
     WHERE a.ord_date = b.ord_date);

--15

SELECT customer_id,cust_name, city
FROM customer
WHERE EXISTS
   (SELECT *
    FROM customer 
    WHERE city='London');

--16

SELECT * 
FROM salesman 
WHERE salesman_id IN (
   SELECT DISTINCT salesman_id 
   FROM customer a 
   WHERE EXISTS (
      SELECT * 
      FROM customer b 
      WHERE b.salesman_id=a.salesman_id 
      AND b.cust_name<>a.cust_name));

--17

SELECT * 
FROM salesman 
WHERE salesman_id IN (
   SELECT DISTINCT salesman_id 
   FROM customer a 
   WHERE NOT EXISTS (
      SELECT * FROM customer b 
      WHERE a.salesman_id=b.salesman_id 
      AND a.cust_name<>b.cust_name));

--18

SELECT * 
FROM salesman a 
WHERE EXISTS     
   (SELECT * FROM customer b     
    WHERE a.salesman_id=b.salesman_id     
	 AND 1<             
	     (SELECT COUNT (*)              
		  FROM orders             
		  WHERE orders.customer_id =            
		  b.customer_id));

--19

SELECT *
FROM salesman 
WHERE city=ANY
    (SELECT city
     FROM customer);

--20

SELECT *
FROM salesman 
WHERE city IN
    (SELECT city
     FROM customer);

--21

SELECT *
FROM salesman a
WHERE EXISTS
   (SELECT *
	FROM CUSTOMER b
	WHERE  a.name  < b.cust_name);

--22

SELECT *
FROM customer
WHERE grade > ANY
   (SELECT grade
	FROM CUSTOMER
	WHERE  city < 'New York');

--23

SELECT *
FROM Orders
WHERE purch_amt > ANY
   (SELECT purch_amt
	FROM orders
	WHERE  ord_date='2012/09/10');

--24

SELECT *
FROM orders
WHERE purch_amt < ANY
   (SELECT purch_amt
	FROM orders a, customer b
	WHERE  a.customer_id=b.customer_id
	AND b.city='London');

--25

SELECT *
FROM orders
WHERE purch_amt < 
   (SELECT MAX (purch_amt)
	FROM orders a, customer b
	WHERE  a.customer_id=b.customer_id
	AND b.city='London');

--26

SELECT *
FROM customer
WHERE grade > ALL
   (SELECT grade
	FROM customer
	WHERE city='New York');

--27

SELECT *
FROM customer
WHERE grade > ALL
(SELECT grade FROM customer WHERE city = 'New York')

--28

SELECT *
FROM customer 
WHERE grade <> ANY
   (SELECT grade
	FROM customer
	WHERE city='London');

--29

SELECT *
FROM customer 
WHERE grade NOT IN
   (SELECT grade
	FROM customer
	WHERE city='Paris');

--30

SELECT *
FROM customer 
WHERE NOT grade = ANY
   (SELECT grade
	FROM customer
	WHERE city='Dallas');