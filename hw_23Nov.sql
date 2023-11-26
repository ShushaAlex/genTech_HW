-- Вывести самый дорогой товар из категории 4
SELECT *
FROM Products
WHERE 
  CategoryID = 4
ORDER BY Price DESC
LIMIT 1;

-- Вывести страны поставщиков, кроме поставщика 1
SELECT Country
-- (Или SELECT DISTINCT, если мы не хотим повторения стран в проекции)
FROM Suppliers
WHERE NOT 
	SupplierID = 1;

-- Вывести клиентов из Germany, имена которых начинаются на t
SELECT * FROM Customers
WHERE 
Country = "Germany"
AND
CustomerName LIKE 'T%';

-- Вывести телефоны перевозчиков
SELECT Phone FROM Shippers;
