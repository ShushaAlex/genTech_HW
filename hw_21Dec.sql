-- Вывести ко-во товаров с ценой от 10 до 250 EUR
SELECT 
	COUNT(*) AS products_count
FROM Products
WHERE Price BETWEEN 10 AND 250;

-- Вывести ко-во поставщиков не из UK и не из China
SELECT
	COUNT(*) AS supplies_count_exc_UK_China
FROM Suppliers
WHERE NOT Country IN ('UK', 'China');

-- Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT
	AVG(Price) AS avg_price,
    MAX(Price) AS max_price,
    MIN(Price) AS min_price,
    COUNT(*) AS prod_count
FROM Products
WHERE CategoryID IN (3, 5);

-- Вывести общую сумму проданных товаров
SELECT
	SUM(Products.Price * OrderDetails.Quantity) AS sum_of_saled_products
FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID

-- Вывести данные о заказах (номерзаказа, имяклиента, странаклиента, фамилияменеджера, названиекомпанииперевозчика)
SELECT
	Orders.OrderID AS order_id,
    Customers.CustomerName AS customer_name,
    Customers.Country AS customer_country,
    Employees.LastName AS employee_lastName,
    Shippers.ShipperName AS shipper_name
FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
JOIN Shippers ON Shippers.ShipperID = Orders.ShipperID;

-- Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT
	SUM(Products.Price * OrderDetails.Quantity) AS sum_saled_prod_GER
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.Country = 'Germany';
