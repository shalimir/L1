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


