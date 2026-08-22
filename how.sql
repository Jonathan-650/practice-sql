SELECT name FROM (
SELECT name, COUNT(1) AS total, SUM(stock) AS total_stock FROM ingredient i
JOIN drink_ingredient di ON i.id = di.ingredient_id
WHERE unit = 'kg'
GROUP BY na) sf
WHERE sf.total_stock > (
SELECT AVG(stock) FROM ingredient WHERE unit = 'kg'
)

WITH drink_ingredients AS (
    SELECT name, COUNT(1) AS total, SUM(stock) AS total_stock 
    FROM ingredient i
    JOIN drink_ingredient di ON i.id = di.ingredient_id
    WHERE unit = 'kg'
    GROUP BY name
)
SELECT dis.name
FROM drink_ingredients dis
WHERE dis.total_stock > (
SELECT AVG(stock) FROM ingredient WHERE unit = 'kg'
);

SELECT 
CONCAT('Chef. ', fullname) AS chef_name,
CONCAT('+62 ', SUBSTRING(phone, 2)) AS contact_name
FROM chef
ORDER BY fullname ASC;

SELECT name, stock FROM ingredient HAVING stock < (
    SELECT AVG(stock) FROM ingredient WHERE unit = 'kg')
ORDER BY stock DESC, name ASC
LIMIT 10;



SELECT DATE_FORMAT(record_at, '%W') AS day_order, COUNT(1) AS total_order, SUM(price) AS total_price
FROM food_cooking_history fch
JOIN food f ON fch.food_id = f.id
GROUP BY day_order
ORDER BY total_price DESC;

WITH drink_sales AS (
    SELECT DATE_FORMAT(record_at, '%W') AS day_order, SUM(price) AS total_price
    FROM drink_cooking_history dch
    JOIN drink d ON dch.drink_id = d.id
    GROUP BY day_order
)
SELECT MAX(ds.total_price) AS max_sales, MIN(ds.total_price) AS min_sales
FROM drink_sales ds

SELECT * FROM
(
    SELECT category, AVG(price) AS avg_price 
    FROM food
	GROUP BY category
) q
WHERE avg_price < (
	SELECT MAX(price) FROM drink 
)
ORDER BY avg_price DESC;

