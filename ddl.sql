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