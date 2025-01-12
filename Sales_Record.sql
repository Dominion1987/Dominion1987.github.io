USE [Novermber_cohort_Data]
GO

SELECT [Order Number]
      ,[Purchase_Amount]
      ,[Order Date]
      ,[Customer ID]
      ,[Salesman_id]
  FROM [dbo].[Order$]

GO


Delete from [dbo].[Order$]
where[Order Number] is null

--1.write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.

SELECT I.[Order Number]
      ,I.[Purchase_Amount]
      ,I.[Order Date]
      ,I.[Customer ID]
      ,I.[Salesman_id]
	  ,P.[City]
	  ,P.[Customer_Name]
         FROM [dbo].[Order$] AS I
FULL OUTER JOIN [dbo].[Customer$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
  
--2.write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.

SELECT I.[Order Number]
      ,I.[Purchase_Amount]
      ,P.[City]
	  ,P.[Customer_Name]
         FROM [dbo].[Order$] AS I
FULL OUTER JOIN [dbo].[Customer$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
WHERE [Purchase_Amount] BETWEEN 500 AND 2000;

--3.write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
SELECT I.[Salesman_id]
      ,I.[Customer_Name]
	  ,P.[commission]
      ,P.[City]
         FROM [dbo].[Customer$] AS I
FULL OUTER JOIN [dbo].[Salesman$] AS P
ON I.[Salesman_id]= P.[Salesman_id]

--4.write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.  
SELECT I.[Salesman_id]
      ,P.[Name]
	  ,P.[commission]
      ,P.[City]
         FROM [dbo].[Order$] AS I
FULL OUTER JOIN [dbo].[Salesman$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
WHERE [commission]>'0.12';

--5.write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.  
SELECT I.[Salesman_id]
      ,I.[Customer_Name]
	  ,I.[City] AS Customercity
	  ,P.[commission]
	  ,P.[Name] AS Salesman
      ,P.[City] AS Salesmancity
         FROM [dbo].[Customer$] AS I
FULL OUTER JOIN [dbo].[Salesman$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
WHERE I.[City]<>P.[City]
AND P.[commission]>'0.12';

--6.write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
SELECT I.[Order Number]
      ,I.[Purchase_Amount]
      ,I.[Order Date]
      ,I.[Salesman_id]
	  ,P.[Customer_Name]
	  ,P.[Grade]
	  ,S.[commission]
         FROM [dbo].[Order$] AS I
FULL OUTER JOIN [dbo].[Customer$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
FULL OUTER JOIN [dbo].[Salesman$] AS S
ON I.[Salesman_id] = S. [Salesman_id]
  
 
--7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 

SELECT I.[Order Number]
      ,I.[Purchase_Amount]
      ,I.[Order Date]
	  ,I.[Customer ID] AS CustomerID_Order
      ,I.[Salesman_id] AS SalesmanID_Order
	  ,P.[Customer_Name] AS Customername
	  ,P.[Customer_ID] AS CustmerID_customer
	  ,P.[City] AS Citycustomer
	  ,P.[Grade]
	  ,P.[Salesman_id] AS SalesmanID_customer
	  ,S.[Salesman_id] AS SalesmanID_sales
	  ,S.[Name] AS Salesman_name
	  ,S.[city] AS Citysalesman
	  ,S.[commission]
         FROM [dbo].[Order$] AS I
FULL OUTER JOIN [dbo].[Customer$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
FULL OUTER JOIN [dbo].[Salesman$] AS S
ON I.[Salesman_id] = S. [Salesman_id]
  


 SELECT I.[Order Number]
      ,I.[Purchase_Amount]
      ,I.[Order Date]
	  ,I.[Customer ID] 
      ,I.[Salesman_id] 
	  ,P.[Customer_Name] AS Customername
	  ,P.[Customer_ID] 
	  ,P.[City] 
	  ,P.[Grade]
	  ,S.[Name] AS Salesman_name
	  ,S.[commission]
         FROM [dbo].[Order$] AS I
FULL OUTER JOIN [dbo].[Customer$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
FULL OUTER JOIN [dbo].[Salesman$] AS S
ON I.[Salesman_id] = S. [Salesman_id]

--8.write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.

SELECT I.[Salesman_id]
      ,I.[Customer_Name]
	  ,I.[Customer_ID]
	  ,I.[City] AS Customercity
	  ,I.[Grade]
	  ,P.[Name] AS Salesman
      ,P.[City] AS Salesmancity
         FROM [dbo].[Customer$] AS I
FULL OUTER JOIN [dbo].[Salesman$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
ORDER BY [Customer_ID] DESC; 

--9. write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.

SELECT I.[Salesman_id]
      ,I.[Customer_Name]
	  ,I.[Customer_ID]
	  ,I.[City] AS Customercity
	  ,I.[Grade]
	  ,P.[Name] AS Salesman
      ,P.[City] AS Salesmancity
         FROM [dbo].[Customer$] AS I
FULL OUTER JOIN [dbo].[Salesman$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
WHERE [Grade]<300
ORDER BY [Customer_ID] DESC; 

--10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.


SELECT I.[Order Number]
      ,I.[Purchase_Amount]
      ,I.[Order Date]
      ,I.[Salesman_id]
	  ,P.[City]
	  ,P.[Customer_Name]
         FROM [dbo].[Order$] AS I
LEFT JOIN [dbo].[Customer$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
ORDER BY [Order Date] DESC;

--11. SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.

SELECT I.[Order Number]
      ,I.[Purchase_Amount]
      ,I.[Order Date]
	  ,P.[Customer_Name] AS Customername
	  ,P.[City] 
	  ,S.[Name] AS Salesman_name
	  ,S.[commission]
         FROM [dbo].[Order$] AS I
FULL OUTER JOIN [dbo].[Customer$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
FULL OUTER JOIN [dbo].[Salesman$] AS S
ON I.[Salesman_id] = S. [Salesman_id];

--12. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.

SELECT I.[Salesman_id]
      ,I.[Customer_Name]
	  ,I.[Customer_ID]
	  ,P.[Name] AS Salesman_Name
         FROM [dbo].[Customer$] AS I
FULL OUTER JOIN [dbo].[Salesman$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
ORDER BY [Name] DESC; 

--13.write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.

SELECT I.[Order Number]
      ,I.[Purchase_Amount]
      ,I.[Order Date]
	  ,P.[Customer_Name] AS Customername
	  ,P.[City] 
	  ,P.[Grade]
	  ,S.[Name] AS Salesperson
	  ,S.[commission]
         FROM [dbo].[Order$] AS I
FULL OUTER JOIN [dbo].[Customer$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
FULL OUTER JOIN [dbo].[Salesman$] AS S
ON I.[Salesman_id] = S. [Salesman_id]
ORDER BY S.[Name], P.[Customer_Name], I.[Order Date];

--14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.

SELECT DISTINCT S.[Salesman_id]
                ,S.[Name] AS Salesman_Name
                ,S.[city]
				,S.[commission]
FROM [dbo].[Salesman$] AS S
LEFT JOIN [dbo].[Customer$] AS P
ON S. [Salesman_id] = P.[Salesman_id]
LEFT JOIN [dbo].[Order$] AS I
ON S. [Salesman_id]  = I.[Salesman_id]
WHERE 
(I.[Purchase_Amount]>=2000 AND P.[Grade] IS NOT NULL)
OR I.[Order Number] IS NULL
OR P.Customer_ID IS NULL;

--15. For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount

SELECT COALESCE(I.[Salesman_id],P.[Salesman_id]) AS Salesman_ID
      ,I.[Purchase_Amount]
	  ,I.[Order Number]
	  ,I.[Order Date]
	  ,P.[City]
	  FROM [dbo].[Order$] AS I
LEFT JOIN [dbo].[Customer$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
WHERE I.[Salesman_id] IS NOT NULL
 OR P.[Salesman_id] IS NOT NULL;


 --16. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.

 SELECT I.[Purchase_Amount]
	  ,I.[Order Number]
	  ,I.[Order Date]
	  ,P.[City]
	  ,p.[Customer_Name]
	  FROM [dbo].[Order$] AS I
LEFT JOIN [dbo].[Customer$] AS P
ON I.[Salesman_id]= P.[Salesman_id]
WHERE [Grade] IS NOT NULL(

SELECT 'Unknown' AS City,
	   'Unknown' As Customer_Name,
       I.[Purchase_Amount]
	  ,I.[Order Number]
	  ,I.[Order Date]
	  FROM [dbo].[Order$] AS I
WHERE I.[Salesman_id] NOT IN (SELECT  Salesman_id FROM [dbo].[Customer$]));

--17. Write a SQL query to combine each row of the salesman table with each row of the customer table.

SELECT I.[Salesman_id]
      ,I.[Customer_Name]
	  ,I.[Customer_ID]
	  ,I.[City] AS Customer_City
	  ,I.[Grade]
	  ,P.[Salesman_id] AS SalesmanID
	  ,P.[Name] AS Salesman_Name
	  ,P.[city] AS Salesman_city
	  ,p.[commission]
         FROM [dbo].[Customer$] AS I
FULL OUTER JOIN [dbo].[Salesman$] AS P
ON I.[Salesman_id]= P.[Salesman_id]

--18. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.

SELECT I.[Salesman_id]
      ,I.[Customer_Name]
	  ,I.[Customer_ID]
	  ,I.[City] AS Customer_City
	  ,I.[Grade]
	  ,P.[Salesman_id] AS SalesmanID
	  ,P.[Name] AS Salesman_Name
	  ,P.[city] AS Salesman_city
	  ,p.[commission]
         FROM [dbo].[Customer$] AS I
   CROSS JOIN [dbo].[Salesman$] AS P
WHERE I.[City]= P.[city] 

--19. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.

SELECT I.[Salesman_id]
      ,I.[Customer_Name]
	  ,I.[Customer_ID]
	  ,I.[City] AS Customer_City
	  ,I.[Grade]
	  ,P.[Salesman_id] AS SalesmanID
	  ,P.[Name] AS Salesman_Name
	  ,P.[city] AS Salesman_city
	  ,p.[commission]
         FROM [dbo].[Customer$] AS I
   CROSS JOIN [dbo].[Salesman$] AS P
WHERE P.[City] IS NOT NULL AND I.[Grade] IS NOT NULL;

--20. Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.

SELECT I.[Salesman_id]
      ,I.[Customer_Name]
	  ,I.[Customer_ID]
	  ,I.[City] AS Customer_City
	  ,I.[Grade]
	  ,P.[Salesman_id] AS SalesmanID
	  ,P.[Name] AS Salesman_Name
	  ,P.[city] AS Salesman_city
	  ,p.[commission]
         FROM [dbo].[Customer$] AS I
   CROSS JOIN [dbo].[Salesman$] AS P
WHERE P.[City]<>I.[City] AND I.[Grade] IS NOT NULL
