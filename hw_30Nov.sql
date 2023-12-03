-- Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT Products.ProductName AS Product_Name,
	Products.Price AS Price_USD
FROM Products
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
ORDER BY Price DESC
LIMIT 1;

-- Вывести два самых дорогих товара из категории Beverages из USA

SELECT Products.*
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE 
Categories.CategoryName = "Beverages"
AND
Suppliers.Country = "USA"
ORDER BY Products.Price DESC
LIMIT 2;

-- Вывести список стран, которые поставляют морепродукты

SELECT DISTINCT Suppliers.Country
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryName = "Seafood";
