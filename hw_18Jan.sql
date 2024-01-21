-- В рамках БД "песочница" выведите З/П каждого менеджера, исходя из ставки в 5% от суммы заказов (к сожалению, песочница упала, поэтому не смогла проверить насколько решение рабочее)

SELECT
	Employees.FirstName,
    Employees.LastName,
    SUM(OrderDetails.Quantity * Products.Price) AS Total_sold,
    Total_sold * 0.05 AS Salary
FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY Orders.EmployeeID
