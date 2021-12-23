#Работаем с SQL 27 стр
#Выборка данных
#1
-- SELECT ALL  onum,  amt, odata
-- FROM orders;
#2
-- SELECT ALL *
-- FROM customers
-- WHERE snum = 1001;
#3
-- SELECT city, sname, snum,comm
-- FROM sales_people;
#4
-- SELECT rating, cname
-- FROM customers
-- WHERE city = 'San Jose';
#5
-- SELECT DISTINCT snum
-- FROM orders;

# 4 глава работа с булевыми предикатами
#OR
-- SELECT *
-- FROM customers
-- WHERE city = 'San Jose'
-- OR rating >99;1
#NOT
-- SELECT *
-- FROM customers
-- WHERE city = 'San Jose'
-- OR NOT rating > 200;
#NOT
-- SELECT *
-- FROM orders
-- WHERE NOT amt > 100;
#Скобки
-- SELECT *
-- FROM orders
-- WHERE NOT((odata = '1990-03-10' AND snum > 1002) OR amt > 2000.0);

#3 Работаем с SQL страница 38
#1) Вернуть все заявки, превыщающие 1000 долларов
-- SELECT  *
-- FROM orders
-- WHERE amt > 1000.0;
#2) Вернуть именна продавцов и названия городов с города Лондон с комиссионными больше 10%
-- SELECT sname, city
-- FROM sales_people
-- WHERE city = 'London' AND comm > 0.10; 
#3) Предоставить список всех покупателей чей рейтинг больше или равен 100
-- SELECT *
-- FROM customers
-- WHERE rating >= 100;

# глава 5 Использование специальных операторов в "условиях"
#Cпециальный оператор IN
#Найти всех продавцов, расположенных в Лондоне или Барселоне
-- SELECT sname
-- FROM sales_people
-- WHERE city IN('London','Barcelona');
#Найти всех покупателей обслуживаемых продавцами 1001, 1007, 1004
-- SELECT cname
-- FROM customers 
-- WHERE snum IN(1001, 1007, 1004);
#Специальный оператор BETWEEN
#Предоставить имена продавцов с коммиссионными в диапозоне от 10% до 12%
-- SELECT sname
-- FROM sales_people
-- WHERE comm BETWEEN 0.10 AND 0.12;
#Оператор LIKE

#Оператор IS с ключевым словом NULL
#Поиск всех записей с NULL значениями в таблице с покупателями
-- SELECT *
-- FROM customers
-- WHERE city IS NULL;
#Поиск всех записей с NOT NULL значениями в таблице с покупателями
-- SELECT *
-- FROM customers
-- WHERE city IS NOT NULL;

# Работаем с SQL
#Выдача сведений о всех заявках принятых 3 или 4 октября 1990
-- SELECT *
-- FROM orders
-- WHERE odata IN('1990-03-10','1990-04-10');
#Выдача всех покупателей которых обслуживает продавец Peel
-- SELECT *
-- FROM customers
-- WHERE snum  IN(1001,1004);
#Вывести все заявки у которых поле amt указано 0 или NULL
-- SELECT *
-- FROM orders
-- WHERE amt = 0 OR amt IS NULL;

#Суммирование данных с помощью функций агрегирования

#Найти сумму всех заявок 
-- SELECT SUM(amt) as money
-- FROM orders;
#Поиск среднего значения по всем заказам
-- SELECT AVG(amt)
-- FROM orders;
#Поиск среднего значения по каждому заказу заказу
-- SELECT onum ,AVG(amt)
-- FROM orders
-- GROUP BY onum;
#Вывести количество заказов оформленных на каждого продавца
-- SELECT snum, COUNT(snum)
-- FROM orders
-- GROUP BY snum;

#Какой продавец получает максимальные комиссионные
-- SELECT sname,comm
-- FROM sales_people
-- WHERE comm = (SELECT MAX(comm) FROM sales_people);
