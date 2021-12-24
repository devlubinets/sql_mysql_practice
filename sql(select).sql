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
#Использование предложения GROUP BY

-- Найти наибольший заказ из тех, что получил каждый из продавцов
-- SELECT snum, MAX(amt)
-- FROM orders
-- GROUP BY snum;

-- Найти сумму заказов по каждому из продавцов
-- SELECT snum, SUM(amt)
-- FROM orders
-- GROUP BY snum;

-- Найти наибольший заказ, сделанный каждым продавцов на каждую дату
-- SELECT snum, odata, MAX(amt)
-- FROM orders
-- GROUP BY snum, odata; 

-- Использование предложения HAVING

-- Найти наибольший заказ, сделанный каждым продавцов на 
-- каждую дату с покумкой цена которой > 3000
-- SELECT snum, odata, MAX(amt)
-- FROM orders
-- GROUP BY snum, odata
-- HAVING MAX(amt) > 3000.0; 

-- Работаем с SQL

--  Вывести все заявки за 3 окт 1990 года
-- SELECT onum, amt, odata
-- FROM orders
-- WHERE odata = '1990-03-10';

-- Количество различных городов в таблице покупателей
-- SELECT count(distinct city)
-- FROM customers
-- WHERE city IS NOT NULL;

-- Вывод найменьшего заказа для каждого покупателя
-- SELECT cnum, MIN(amt)
-- FROM orders
-- GROUP BY cnum;

-- Вывод найбольшего рейтинга для каждого города
-- SELECT city, MAX(rating)
-- FROM customers
-- GROUP BY city;

-- Вывод всех продавцов получающих заказы каждый день
-- SELECT odata, count(distinct snum)
-- FROM orders,snum
-- GROUP BY odata;


-- Форматирование результатов запросов

-- Вывод всех полей, плюс одного скалярного модифицированного поля комиссионых
-- SELECT *, comm*100 
-- FROM sales_people;

-- Вставить символ % в выдачу с результатами
-- SELECT '%', comm
-- FROM sales_people;

-- Упорядочивание заявок по номеру по возрастанию при помощи ORDER BY
-- SELECT * 
-- FROM orders
-- ORDER BY onum ASC;

-- Упорядочивание заявок по номеру по убыванию при помощи ORDER BY
-- SELECT *
-- FROM orders 
-- ORDER BY onum DESC;

-- Упорядочивание групп
-- SELECT snum, odata, MAX(amt)
-- FROM orders
-- GROUP BY snum, odata
-- ORDER BY snum;

-- Упорядочивание по возрастанию по номеру столбца
-- SELECT sname, comm
-- FROM sales_people
-- ORDER BY 2 ASC;

-- Подсчитать количество заявок для каждого продавца и вывести результат в убывающем порядке
-- SELECT snum, COUNT(onum)
-- FROM orders
-- GROUP BY snum1
-- ORDER BY snum;

-- Работаем с SQL
-- Выдать номер заявки, номер продавца и общее значение коммисионных продавца,
-- упорядочить по значениям последнего столбца
-- SELECT onum, snum, amt*0.12 as comm
-- FROM orders
-- ORDER BY amt DESC;

-- Вывести макс рейтинг каждого города и представить в виде:
-- For the (city), the highest rating is: (rating)
-- SELECT 'For the city ',city,'the highest rating is:', MAX(rating) as rating
-- FROM customers
-- GROUP BY city
-- ORDER BY rating DESC;

-- Выдать список покупателей в порядке УБЫВАНИЯ
-- рейтинга 
-- SELECT rating, cname, cnum
-- FROM customers
-- ORDER BY rating DESC

-- Вывод итогов по заказам на каждый день 
-- список отсортирован в убывающем порядке
-- SELECT DISTINCT odata, SUM(amt) as sum_pay
-- FROM orders
-- GROUP BY odata
-- ORDER BY odata

-- Глава 7 Использование множества таблицalter
-- в одном запросе

-- Операция "эквисоединения" соединения таблиц посредством ссылочной целостности
-- SELECT customers.cname, sales_people.sname
-- FROM customers, sales_people
-- WHERE sales_people.snum = customers.snum;

-- Работаем с SQL

-- Выдать каждый номер заказа и имя покупателя сделавшего заказ
-- SELECT orders.onum, customers.cname
-- FROM orders, customers
-- WHERE orders.cnum = customers.cnum

-- Выдать после каждого номер заказа имена продавцов и покупателей
-- SELECT orders.onum, sales_people.sname, customers.cname
-- FROM orders, sales_people, customers
-- WHERE orders.snum = sales_people.snum AND orders.cnum = customers.cnum;

-- Выдает имена всех покупателей обслуживаемых продавцами имеющими комиссионные более 12%.
-- Выходные данные: имя покупателя, имя продавца, комиссионые продавца
-- SELECT customers.cname, sales_people.sname, sales_people.comm
-- FROM customers, sales_people, orders
-- WHERE sales_people.comm > 0.12 AND customers.snum = sales_people.snum;

-- Выдать список заказов, расчетные коммисионные от покупателей с рейтингом более 100
-- SELECT orders.onum, (orders.amt * sales_people.comm) as total_comm
-- FROM orders, customers, sales_people
-- WHERE customers.rating > 100 AND orders.cnum = customers.cnum 
--                              AND orders.snum = sales_people.snum;

