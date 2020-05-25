-- 会员
DROP TABLE member;
CREATE TABLE member(
       id VARCHAR(32) DEFAULT '1' PRIMARY KEY,
       NAME VARCHAR(20),
       nickname VARCHAR(20),
       phoneNum VARCHAR(20),
       email VARCHAR(20) 
);
INSERT INTO MEMBER (id, NAME, nickname, phonenum, email)
VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');
-- 旅客
DROP TABLE traveller;
CREATE TABLE traveller(
  id VARCHAR(32) DEFAULT '1' PRIMARY KEY,
  NAME VARCHAR(20),
  sex VARCHAR(20),
  phoneNum VARCHAR(20),
  credentialsType INT,
  credentialsNum VARCHAR(50),
  travellerType INT
);
INSERT INTO traveller (`id`, `name`, `sex`, `phonenum`, `credentialstype`, `credentialsnum`, `travellertype`)
VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
INSERT INTO traveller (`id`, `name`, `sex`, `phonenum`, `credentialstype`, `credentialsnum`, `travellertype`)
VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);

-- 订单
DROP TABLE orders;
CREATE TABLE orders(
  id VARCHAR(32) DEFAULT '1' PRIMARY KEY,
  orderNum VARCHAR(20) NOT NULL UNIQUE,
  orderTime DATETIME,
  peopleCount INT,
  orderDesc VARCHAR(500),
  payType INT,
  orderStatus INT,
  productId VARCHAR(32),
  memberId VARCHAR(32),
  FOREIGN KEY (productId) REFERENCES product(id),
  FOREIGN KEY (memberId) REFERENCES member(id)
)
INSERT INTO orders (`id`, `ordernum`, `ordertime`, `peoplecount`, `orderdesc`, `paytype`, `orderstatus`,`productid`, `memberid`)
VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '12345','2018-02-3 12:00:00', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO orders (`id`, `ordernum`, `ordertime`, `peoplecount`, `orderdesc`, `paytype`, `orderstatus`,`productid`, `memberid`)
VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '54321', '2018-02-3 12:00:00', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO orders (`id`, `ordernum`, `ordertime`, `peoplecount`, `orderdesc`, `paytype`, `orderstatus`,`productid`, `memberid`)
VALUES ('2FF351C4AC744E2092DCF08CFD314420', '67890', '2018-02-3 12:00:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO orders (`id`, `ordernum`, `ordertime`, `peoplecount`, `orderdesc`, `paytype`, `orderstatus`,`productid`, `memberid`)
VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', '2018-02-3 12:00:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO orders (`id`, `ordernum`, `ordertime`, `peoplecount`, `orderdesc`, `paytype`, `orderstatus`,`productid`, `memberid`)
VALUES ('E4DD4C45EED84870ABA83574A801083E', '11111', '2018-02-3 12:00:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO orders (`id`, `ordernum`, `ordertime`, `peoplecount`, `orderdesc`, `paytype`, `orderstatus`,`productid`, `memberid`)
VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222','2018-02-3 12:00:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO orders (`id`, `ordernum`, `ordertime`, `peoplecount`, `orderdesc`, `paytype`, `orderstatus`,`productid`, `memberid`)
VALUES ('55F9AF582D5A4DB28FB4EC3199385762', '33333','2018-02-3 12:00:00', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO orders (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444','2018-02-3 12:00:00', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO orders (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
VALUES ('3081770BC3984EF092D9E99760FDABDE', '55555','2018-02-3 12:00:00', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');

-- 订单与旅客中间表
DROP TABLE order_traveller;
CREATE TABLE order_traveller(
  orderId VARCHAR(32),
  travellerId VARCHAR(32),
  PRIMARY KEY (orderId,travellerId),
  FOREIGN KEY (orderId) REFERENCES orders(id),
  FOREIGN KEY (travellerId) REFERENCES traveller(id)
)

INSERT INTO order_traveller (`orderid`, `travellerid`)
VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO ORDER_TRAVELLER (orderid, travellerid)
VALUES ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO order_traveller (`orderid`, `travellerid`)
VALUES ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO order_traveller (`orderid`, `travellerid`)
VALUES ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO order_traveller (`orderid`, `travellerid`)
VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO order_traveller (`orderid`, `travellerid`)
VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO order_traveller (`orderid`, `travellerid`)
VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO order_traveller (`orderid`, `travellerid`)
VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO order_traveller (`orderid`, `travellerid`)
VALUES ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');

