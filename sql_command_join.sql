#INNER JOIN
-- SELECT * FROM buyers  INNER JOIN shopcarts ON cart_buyer = id_shopcart;

#OUTER * JOIN 
#LEFT значит увидем все записи с левой таблицы
-- SELECT * FROM buyers LEFT OUTER JOIN shopcarts ON cart_buyer = id_shopcart;

#RIGHT
#SELECT * FROM buyers RIGHT OUTER JOIN shopcarts ON cart_buyer = id_shopcart;

#Полное множество LEFT & RIGHT
#(SELECT * FROM buyers LEFT OUTER JOIN shopcarts ON cart_buyer = id_shopcart)

#UNION

#(SELECT * FROM buyers RIGHT OUTER JOIN shopcarts ON cart_buyer = id_shopcart)

#Подзапрос

-- SELECT * FROM products
-- WHERE products.price_product > (SELECT AVG(products.price_product) FROM products);

#Агрегатные функции
#Колличество элементов 
-- SELECT count(*) as number_product FROM products
#Max
-- SELECT max(price_product) as max_price FROM products
#Min
-- SELECT min(price_product) as min_price FROM products


#Фильтрация по IN
-- SELECT * FROM shop.buyers
-- INNER JOIN shop.shopcarts ON id_shopcart = cart_buyer
-- WHERE id_product IN (2,10,4);

#Клиент который купил больше всего товаров
-- SELECT id_shopcart, sum(price_product) FROM shopcarts
-- INNER JOIN products ON products.id = id_product
-- GROUP BY id_shopcart;


#Топ 10 самых дорогих товаров
-- SELECT name_product, MAX(price_product) FROM products
-- GROUP BY name_product
-- LIMIT 10;


