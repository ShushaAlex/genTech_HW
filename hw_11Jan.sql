-- 1. Найти мин/стоимость товаров для каждой категории
SELECT
	CategoryID,
	MIN(Price) AS MinPrice 
FROM Products
GROUP BY CategoryID;
-- если нужно вывести название категории:
SELECT
	Categories.CategoryName,
	MIN(Price) AS MinPrice 
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY Products.CategoryID;

-- 2. Вывести названия категорий, в которых более 10 товаров
SELECT
	Categories.CategoryName,
	COUNT(*) AS Product_count
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY Products.CategoryID
HAVING Product_count > 10;

-- 3. Вывести три самых дешевых заказа
SELECT 
	OrderDetails.OrderID,
	SUM(OrderDetails.Quantity * Products.Price) AS Order_price
FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY OrderDetails.OrderID
ORDER BY Order_price
LIMIT 3;

-- 4. Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15 
-- (таких менеджеров нет, мин кол-во заказов - 42)
SELECT 
	Employees.FirstName,
    Employees.LastName,
    COUNT(*) AS Orders_count
FROM Orders
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.EmployeeID
HAVING Orders_count < 15
ORDER BY Orders_count;

-- 5. Вывести ТОП-1 стран по ко-ву клиентов
SELECT 
	Country,
	COUNT(*) AS Customers_count
FROM Customers
GROUP BY Country
ORDER BY Customers_count DESC
LIMIT 1;
