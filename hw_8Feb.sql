CREATE DATABASE testDB;
USE testDB;

-- Создать таблицу students(1)
-- firstname varchar not null
-- lastname varchar not null
-- age integer
-- subject varchar not null
-- mark numeric(2, 1) от 0 до 5

CREATE TABLE students (
	firstname varchar(100) NOT NULL,
    lastname varchar(100) NOT NULL,
    age integer,
    subject varchar(100) NOT NULL,
    mark numeric(2, 1));
    
-- Добавить поле id уникальное значение, не null, автозаполнение в начало таблицы
ALTER TABlE students
ADD id integer UNIQUE;

-- Изменить тип mark на integer
ALTER TABLE students
MODIFY mark integer;

-- Удалить поле age
ALTER TABLE students
DROP COLUMN age;

-- Добавить поле class integer от 1 до 10, вставить после lastname
ALTER TABLE students
ADD class integer check(class between 1 and 10)
AFTER lastname;

-- Заполнить таблицу строками (10 шт)
INSERT INTO students
values 
	('Alex', 'A', 2, 'java', 5, 1),
    ('Ben', 'B', 1, 'DB', 10, 2),
    ('Carl', 'C', 2, 'DB', 8, 3),
    ('Dim', 'D', 3, 'English', 89, 4),
    ('Erl', 'E', 4, 'java', 7, 5),
    ('Fred', 'F', 7, 'JS', 65, 6),
    ('Greg', 'G', 10, 'JS', 90, 7),
    ('Harl', 'H', 6, 'DB', 43, 8),
    ('Itan', 'I', 7, 'English', 28, 9),
    ('James', 'J', 1, 'java', 73, 10);
    
-- Удалить из таблицы студентов, у которых оценка 0
DELETE FROM students
WHERE mark = 0;

-- Найти всех студентов, у которых оценка выше 3
SELECT
	*
FROM students
WHERE mark > 3;

-- Найти всех студентов, которые учатся в первом классе и у них оценка меньше 3
SELECT
	*
FROM students
WHERE class = 1 AND mark > 3;

-- Удалить из таблицы этих студентов
DELETE FROM students
WHERE class = 1 AND mark > 3;

-- Найти всех студентов, у которых длина имени больше 4 букв
SELECT
	*
FROM students
WHERE LENGTH(firstname) > 4;

-- Найти всех студентов, у которых фамилия начинается с буквы "a" и имеет длину не менее 3 символов.
SELECT
	*
FROM students
WHERE LENGTH(firstname) >= 3 AND LOCATE('a', firstname) = 1;

-- Удалить таблицу.
DROP TABLE students;