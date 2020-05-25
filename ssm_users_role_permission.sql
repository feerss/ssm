-- 用户表
CREATE TABLE users(
id VARCHAR(32) DEFAULT '1' PRIMARY KEY,
email VARCHAR(50) UNIQUE NOT NULL,
username VARCHAR(50),
PASSWORD VARCHAR(50),
phoneNum VARCHAR(20),
STATUS INT
)

-- 角色表
CREATE TABLE role(
id VARCHAR(32) DEFAULT '2' PRIMARY KEY,
roleName VARCHAR(50) ,
roleDesc VARCHAR(50)
)

-- 用户角色关联表
CREATE TABLE users_role(
userId VARCHAR(32),
roleId VARCHAR(32),
PRIMARY KEY(userId,roleId),
FOREIGN KEY (userId) REFERENCES users(id),
FOREIGN KEY (roleId) REFERENCES role(id)
)

-- 资源权限表
CREATE TABLE permission(
id VARCHAR(32) DEFAULT '3' PRIMARY KEY,
permissionName VARCHAR(50),
url VARCHAR(50)
)

-- 角色权限关联表
CREATE TABLE role_permission(
permissionId VARCHAR(32),
roleId VARCHAR(32),
PRIMARY KEY(permissionId,roleId),
FOREIGN KEY (permissionId) REFERENCES permission(id),
FOREIGN KEY (roleId) REFERENCES role(id)
)

INSERT INTO users VALUES('111-222','tom@itcast.com','tom','123','13333333333','1') 
INSERT INTO role VALUES('1111','ADMIN','vip')
INSERT INTO role VALUES('2222','USER','general')
INSERT INTO users_role VALUES('111-222','1111')
INSERT INTO users_role VALUES('111-222','2222')
SELECT * FROM role WHERE id IN (SELECT roleId FROM users_role WHERE userId= '111-222')
UPDATE users SET STATUS =1;
SELECT * FROM product;
INSERT INTO permission(id,permissionName,url) VALUES(REPLACE(UUID(),"-",""),'user findAll','/user/findAll.do');
INSERT INTO permission(id,permissionName,url) VALUES(REPLACE(UUID(),"-",""),'user findById','/user/findById.do');
INSERT INTO role_permission VALUES('a83c04f0856e11eab79300acf99ead3d','1111');
INSERT INTO role_permission VALUES('a83d10fe856e11eab79300acf99ead3d','1111');
INSERT INTO role_permission VALUES('a83c04f0856e11eab79300acf99ead3d','2222');
SELECT REPLACE(UUID(),"-","");
