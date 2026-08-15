SELECT name, stock FROM ingredient
WHERE stock > (
SELECT AVG(stock) FROM ingredient WHERE unit = 'kg'
) AND unit = 'kg';

SELECT i.name, COUNT(1) AS total FROM ingredient i
JOIN drink_ingredient di ON i.id = di.ingredient_id
JOIN drink d ON di.drink_id = d.id
GROUP BY i.name
ORDER BY total DESC;

SELECT SUM(price) AS total_sales, c.fullname
FROM chef c
JOIN food_cooking_history h ON c.id = h.chef_id
JOIN food f ON f.id = h.food_id
GROUP BY c.fullname
ORDER BY total_sales DESC;

SELECT name AS menu, price FROM drink
UNION
SELECT name AS menu, price FROM food
ORDER BY menu ASC;

SELECT i.name FROM ingredient i
JOIN food_ingredient fi ON i.id = fi.ingredient_id
JOIN food f ON fi.food_id = f.id
WHERE f.name = 'Fried Chicken' OR f.name = 'Corn Soup';

SELECT COUNT(1) AS total, day_name FROM schedule
GROUP BY day_name
ORDER BY total DESC;

SELECT d.name, COUNT(1) AS total FROM drink d
JOIN drink_ingredient di ON d.id = di.drink_id
JOIN ingredient i ON di.drink_id = i.id
GROUP BY d.name
HAVING total < 2
UNION
SELECT f.name, COUNT(1) AS total FROM food f
JOIN food_ingredient fi ON f.id = fi.ingredient_id
JOIN ingredient i ON fi.food_id = i.id
GROUP BY f.name
HAVING total < 4
ORDER BY name;

SELECT SUM(f.price) AS total_sales, c.fullname FROM chef c
JOIN manager m ON c.manager_id = m.id
JOIN food_cooking_history fch ON c.id = fch.chef_id
JOIN food f ON fch.food_id = f.id
WHERE m.fullname = 'John Anderson'
GROUP BY c.id, c.fullname
ORDER BY total_sales DESC
LIMIT 1;