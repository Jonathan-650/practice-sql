CREATE database dealership_db;
USE dealership_db;

CREATE TABLE dealership (
	id INT AUTO_INCREMENT PRIMARY KEY,
    dealership_name CHAR(255) NOT NULL,
    address CHAR(255) NOT NULL, 
    description VARCHAR(1000)
);

CREATE TABLE aircrafts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dealership_id INT NOT NULL,
    brand CHAR(255) NOT NULL,
    color CHAR(32) NOT NULL,
    engine CHAR(32) NOT NULL,
    
    FOREIGN KEY (dealership_id) REFERENCES dealership (id)
);

ALTER TABLE dealership ADD phone_number CHAR(16);
ALTER TABLE aircrafts MODIFY color CHAR(36) NOT NULL;
ALTER TABLE dealership DROP COLUMN fax_number;
DROP TABLE boats;
INSERT INTO dealership
VALUE (null, 'totoya', '123 jupiter avenue', null, '123 456 789');
SELECT * FROM dealership;
SELECT dealership_name, address FROM dealership;
INSERT INTO aircrafts
VALUE (null, 1, 'airbus', 'white', 'trent900');
TRUNCATE TABLE dealership;

UPDATE dealership SET address = "123 jupiter street, no.432, jupiter, solar system" where id = 1
DELETE from dealership where id = 1
SELECT * FROM chef WHERE id = 1

SELECT name,price from food WHERE price > 50000 LIMIT 5;

SELECT name,category,price from drink 
WHERE category = "Coffee" || category = "Tea"
ORDER BY category ASC, price DESC;

SELECT name, price, CASE
WHEN price >= 70000 then 'Premium'
WHEN price >= 50000 then 'Standard'
ELSE 'Budget'
END AS price_category
FROM food WHERE is_halal = 1;

SELECT ROUND(AVG(salary), 2) AS average_salary FROM chef WHERE salary > 6000000;

SELECT CONCAT('Chef : ',' ',fullname) AS chef_information, salary FROM chef WHERE salary > 7000000 ORDER BY salary DESC;

SELECT CONCAT(name, ' - ', category) AS drink_information, 
CASE
WHEN is_cold = 1 THEN 'Cold Drink'
ELSE 'Hot Drink'
END AS drink_type
,
price FROM drink
WHERE price > 30000 && is_recommended = 1
LIMIT 5;
