# PART 1
### 1. Download MySQL server for your OS on VM.
![Screenshot_200](https://user-images.githubusercontent.com/106797604/213680597-48f7ccc5-e103-462f-b40d-f095007dbd69.png)
```
sudo apt update
sudo apt install mysql-server -y
sudo systemctl start mysql.service
systemctl status mysql.service
```
### 2. Install MySQL server on VM
![Screenshot_201](https://user-images.githubusercontent.com/106797604/213682136-867e40db-0ec0-4b8e-831d-ea5fe2491646.png)
![Screenshot_204](https://user-images.githubusercontent.com/106797604/213706314-0231835c-e5da-420e-89f9-aadfddb352e1.png)
![Screenshot_205](https://user-images.githubusercontent.com/106797604/213706686-d758c72b-12e7-45f8-bd61-05591ee2224d.png)

###OPTIONAL Installing MySQL Workbench 
```
sudo apt install mysql-workbench
```
### 3. Select a subject area and describe the database schema, (minimum 3 tables)
<img src="https://user-images.githubusercontent.com/123692654/215392725-b9fd8cf8-78ae-43f1-bbf0-2864e929867c.png" align="right">
<img src="https://user-images.githubusercontent.com/123692654/215392738-0e2f6cc9-d9b5-4e30-bd7a-7b5f2bae6bde.png" align="left">

```
mysql> CREATE USER 'vivekappusr'@'%' IDENTIFIED BY 'aa09dd995C72_5355a598fc7D8ab1230a';
Query OK, 0 rows affected (0.02 sec)

mysql> GRANT SELECT, INSERT, UPDATE, DELETE ON mydemodb.* TO 'vivekappusr'@'%';
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT ALL PRIVILEGES ON mydemodb.* TO 'vivekappusr'@'%';
Query OK, 0 rows affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| shalimir           |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use shalimir
Database changed
mysql>

```
### 4. Create a database on the server through the console.
```
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255)
); 

CREATE TABLE products (  
    product_id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(4,2) NOT NULL
);  

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,  
    customer_id INTEGER,  
    product_id INTEGER,  
    date DATETIME,  
    quantity INTEGER  
);
```

![Screenshot_239](https://user-images.githubusercontent.com/123692654/215393773-3be52397-d0c9-468e-ad3c-9970342ba403.png)
![Screenshot_240](https://user-images.githubusercontent.com/123692654/215393775-80ea5336-7d9d-4f12-9cc9-c99a9b2bfe4b.png)

### 5. Fill in tables.
```
INSERT customers (name,phone,email)
VALUES
('Auchan','0954446756','orders@auchan.com'),
('Silpo','0976542231','orders@silpo.com'),
('Fora','0982332516','orders@fora.com');

INSERT products (name,description,price)
VALUES
('apple','Ukraine, price for 1kg','45'),
('potato','Belarus, price for 1kg','23'),
('banana','from Australia, price for 1kg','56'),
('strawberry','from Italy, price for 1kg','96'),
('apple','Poland, price for 1kg','60');

INSERT orders (customer_id,product_id,date,quantity)
VALUES
('1','3','2021-03-08','3'),
('1','5','2021-03-09','38'),
('1','6','2021-03-10','2'),
('3','3','2021-03-02','7'),
('3','2','2021-03-13','13'),
('2','5','2021-03-14','4'),
('2','1','2021-03-14','4'),
('2','5','2021-03-22','7'),
('1','4','2021-03-08','45'),
('1','5','2021-03-08','8'),
('2','4','2021-03-01','3'),
('1','3','2021-03-01','7'),
('3','5','2021-03-01','9'),
('2','3','2021-03-23','22'),
('2','3','2021-03-24','22'),
('1','5','2021-03-08','22'),
('2','1','2021-03-13','5');
```
![Screenshot_241](https://user-images.githubusercontent.com/123692654/215394299-1c6c4737-cd43-48cd-bdaf-550361894d70.png)
![Screenshot_242](https://user-images.githubusercontent.com/123692654/215394303-42af7144-ba8d-41ce-b3dc-cbc39afa0f57.png)


### 6. Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY.
#### 6.1-2.SELECT/ORDER
```
SELECT * FROM customers WHERE name='Auchan'; SELECT * FROM products ORDER BY name;
```

![Screenshot_243](https://user-images.githubusercontent.com/123692654/215394827-96d05a6f-ac53-40ad-82b1-70db00be7a51.png)


#### 6.3.GROUP BY

```
SELECT customers.name, COUNT(*)  FROM orders INNER JOIN customers ON orders.customer_id = customers.customer_id GROUP BY customers.name;
```
![Screenshot_244](https://user-images.githubusercontent.com/123692654/215395527-6560924a-fe48-4245-87d1-756bb14d3ddd.png)

### 7. Execute other different SQL queries DDL, DML, DCL.
#### 7.1.DDL (CREATE/ALTER/DROP)
```
mysql> DROP table customers;
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE customers (
    ->     customer_id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ->     name VARCHAR(255),
    ->     phone VARCHAR(255),
    ->     email VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> ALTER TABLE products DROP COLUMN price;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC products;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| product_id  | int          | NO   | PRI | NULL    | auto_increment |
| name        | varchar(255) | YES  |     | NULL    |                |
| description | varchar(255) | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql>

```


![Screenshot_245](https://user-images.githubusercontent.com/123692654/215484979-c2e3eced-b1f2-403d-b713-a6ebbe9f2bf6.png)
![Screenshot_246](https://user-images.githubusercontent.com/123692654/215484986-8925e0e4-244c-40e9-9557-4b0bbbc53247.png)


#### 7.2.DML (SELECT/INSERT/UPDATE/DELETE)

![Screenshot_212](https://user-images.githubusercontent.com/106797604/213716675-d3124350-f524-45ca-a8

#### 7.3.DCL (GRANT/REVOKE)
```
CREATE USER 'shalimir'@'localhost' IDENTIFIED BY 'aa09dd995C72_5355a598fc7D8ab1230a'; 
GRANT ALL ON shalimir.* TO 'shalimir'@'localhost'; 
REVOKE INSERT ON shalimir.* FROM'shalimir'@'localhost';
```
![Screenshot_247](https://user-images.githubusercontent.com/123692654/215487461-51c726e8-44e4-4d73-b562-a4ee8c9a8aa4.png)

### 8. Create a database of new users with different privileges. Connect to the database as a new user and verify that the privileges allow or deny certain actions.
```
 mysql -u shalimir -p
 aa09dd995C72_5355a598fc7D8ab1230a
```
![Screenshot_248](https://user-images.githubusercontent.com/123692654/215488236-d93223bb-0cb6-4e93-adf5-704f38ed00f5.png)

### 9. Make a selection from the main table DB MySQL.
![Screenshot_249](https://user-images.githubusercontent.com/123692654/215490431-08d203ab-6c63-472a-82fd-bf3e647410af.png)
```
sudo mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
exit

mysql -u root -p
```

![Screenshot_249](https://user-images.githubusercontent.com/123692654/215490431-08d203ab-6c63-472a-82fd-bf3e647410af.png)




# PART 2
### 10.Make backup of your database.
```
sudo su
cd /tmp/
mysqldump -u root -p shalimir > shalimir.sql
cat shalimir.sql
```
<img src="https://user-images.githubusercontent.com/123692654/215492013-3d0abe01-0aaa-48bd-b4a2-364c6d9c8006.png" align="right">
<img src="https://user-images.githubusercontent.com/123692654/215492017-69988718-5ca3-4e40-a2e0-0ab2d9d2ebc4.png" align="left">

![Screenshot_252](https://user-images.githubusercontent.com/123692654/215492020-431895cc-a64b-474b-b45d-f2dc0e4a5bd5.png)


### 11.Delete the table and/or part of the data in the table.

### 12.Restore your database.
```
mysql -u root -p --protocol=tcp shalimir < /tmp/shalimir.sql
zcat /tmp/shalimir.sql.gzip | mysql -u root -p --protocol=tcp shalimir
gunzip < /tmp/shalimir.sql_20230116-184640_sql.gzip | mysql -u root -p --protocol=tcp shalimir
```
### 13.Transfer your local database to RDS AWS.
![Screenshot_254](https://user-images.githubusercontent.com/123692654/215495275-e00ecf83-81c6-48c7-aa1e-eb056e5e6cea.png)

### 14.Connect to your database.
mysql -h shalimir.cduyezchgqea.eu-west-1.rds.amazonaws.com -P 3306 -u shalimir -p
mysql -u shalimir -p -h shalimir.cduyezchgqea.eu-west-1.rds.amazonaws.com shalimir < /tmp/shalimir.sql

### 15.Execute SELECT operator similar step 6.
### 16.Create the dump of your database.
```
root@ip-172-31-44-64:/tmp# mysql -u root -p -h shalimir.cduyezchgqea.eu-west-1.rds.amazonaws.com
mysqldump -u admin -p -h shalimir.cduyezchgqea.eu-west-1.rds.amazonaws.com shalimir > /tmp/shalimir.sql
```

# PART 3
### 17. Create a database. Use the use command to connect to a new database (If it doesn't exist, Mongo will create it when you write to it).
### 18. Create a collection. Use db.createCollection to create a collection. I'll leave the subject up to you. Run show dbs and show collections to view your database and collections.
### 19. Create some documents. Insert a couple of documents into your collection. I'll leave the subject matter up to you, perhaps cars or hats.
### 20. Use find() to list documents out.
![Screenshot_222](https://user-images.githubusercontent.com/106797604/213828675-94aeafb1-79b3-4a92-9ed6-274f41084b55.png)
![Screenshot_223](https://user-images.githubusercontent.com/106797604/213828679-7535aadc-24d5-44b7-ae58-91340595d813.png)
![Screenshot_224](https://user-images.githubusercontent.com/106797604/213828681-330028af-e450-42f0-9026-161e3880773a.png)

