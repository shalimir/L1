EPAM University Programs
Cloud&DevOps Fundamentals Autumn 2022
# AWS Cloud Basic
TASK
### 1. Read the terms of Using the AWS Free Tier and the ability to control their own costs.
### 2. Register with AWS (first priority) or alternatively, you can request access to courses in AWS 
Academy if you are currently a student of certain University.
### 3. Find the hands-on tutorials and AWS Well-Architected Labs for your AWS needs. Explore list of 
step-by-step tutorials for deferent category. Use, repeat as many as you can and have fun))
### 4. Register and pass courses on AWS Educate. Filter by checking Topic Cloud Computing and 
Foundational Level. Feel free to pass more.
### 5. Register and pass free courses on AWS Skillbuilder. AWS Cloud Practitioner Essentials: Core 
Services, AWS Cloud Practitioner Essentials: Cloud Concepts. Try AWS Cloud Quest: Cloud 
Practitioner.
### 6. Pass free courses on Amazon qwiklabs


![Screenshot_256](https://user-images.githubusercontent.com/123692654/215702094-09d55e04-420c-4a08-9931-f960dbc6e8e6.png)
![Screenshot_257](https://user-images.githubusercontent.com/123692654/215702095-a254849c-0ae4-43c5-a3e9-b490e55533ec.png)

### 7. Review Getting Started with Amazon EC2. 
Log Into Your AWS Account, Launch, Configure, Connect and Terminate Your Instance. 
Do not use Amazon Lightsail. 
It is recommended to use the t2 or t3.micro instance and the CentOS operating system.

```
#!/bin/bash
sudo yum update && sudo yum upgrade -y 

# ======Install Nginx=====
#Confirm that the amazon-linux-extras package is installed
which amazon-linux-extras
/usr/bin/amazon-linux-extras

sudo yum install -y amazon-linux-extras
sudo yum -y install nginx
sudo amazon-linux-extras list | grep nginx
sudo amazon-linux-extras enable nginx1

# Back up existing config
mv /etc/nginx /etc/nginx-backup

#======Install PHP =======
sudo yum update && sudo yum upgrade -y 
sudo  amazon-linux-extras | grep php
sudo amazon-linux-extras enable php7.4
sudo yum clean metadata
sudo yum install php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap}
sleep 2
#======= Install MySql server======
sudo yum update && sudo yum upgrade -y && sudo apt install mysql-server -y 
sudo systemctl start mysql.service && systemctl status mysql.service
sleep 2
sudo yum update && sudo yum upgrade -y

```
<img src="https://user-images.githubusercontent.com/123692654/215713953-7dec132f-ee54-403d-b7a2-36ae9192a882.png" align="right">
![Screenshot_259](https://user-images.githubusercontent.com/123692654/215713959-e4364e03-05d1-44c9-a9c3-a5ace8f323df.png)

![Screenshot_260](https://user-images.githubusercontent.com/123692654/215714836-053aea2a-cd9f-4d32-8dc9-ae9a6a462264.png)

