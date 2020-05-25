
CREATE TABLE product( 
id VARCHAR(32) PRIMARY KEY, 
productNum VARCHAR(50) NOT NULL, 
productName VARCHAR(50) CHARACTER SET utf8, 
cityName VARCHAR(50) CHARACTER SET utf8, 
DepartureTime DATETIME, 
productPrice DOUBLE, 
productDesc VARCHAR(500) CHARACTER SET utf8, 
productStatus INT, 
CONSTRAINT product UNIQUE (id, productNum)
 )
 ALTER TABLE product MODIFY COLUMN id CHAR(32) DEFAULT '12B7ABF2A4CC44568B0A7C69F36BF8B7';  
 INSERT INTO product (`id`, `productnum`, `productname`, `cityname`, `departuretime`, `productprice`, `productdesc`, `productstatus`) 
 VALUES ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', '2018-10-10 10:10:00', 1200, '不错的旅行', 1); 
 INSERT INTO product (`id`, `productnum`, `productname`, `cityname`, `departuretime`, `productprice`, `productdesc`, `productstatus`)
  VALUES ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-003', '上海五日游', '上海', '2018-04-25 14:30:00',1800, '魔都我来了', 0); 
 INSERT INTO product (`id`, `productnum`, `productname`, `cityname`, `departuretime`, `productprice`, `productdesc`, `productstatus`) 
 VALUES ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', '2019-10-10 10:10:00', 1200, '不错的旅行', 1);