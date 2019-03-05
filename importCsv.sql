use dependency_updates_db;
LOAD DATA LOCAL INFILE '/dush/product.csv' 
INTO TABLE PRODUCTS 
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n';
