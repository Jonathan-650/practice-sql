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