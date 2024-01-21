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

-- Используя MySQL WorkBench (или аналогичный инструмент) создайте БД music (сервис онлайн-музыки) и в рамках нее таблицы users, tracks с полями на Ваше усмотрение
CREATE DATABASE music;
USE music;

CREATE TABLE users (
	user_id int,
	created_at timestamp,
	first_name varchar(128),
	last_name varchar(128),
	email varchar(128),
	date_of_birth date,
	is_blocked boolean);

CREATE TABLE tracks (
	track_id int,
	title varchar(256),
	artist_id int,
	album_id int,
	genre_id int,
	added_at timestamp,
	is_cansored boolean);
