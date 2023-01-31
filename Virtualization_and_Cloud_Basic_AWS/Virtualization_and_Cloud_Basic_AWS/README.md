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
![Screenshot_258](https://user-images.githubusercontent.com/123692654/215715520-af44f339-f9dc-43ac-b804-e06fee9a20d9.png)
![Screenshot_259](https://user-images.githubusercontent.com/123692654/215715549-e27608b9-7ca6-4605-9b69-a4793c32ef27.png)
![Screenshot_260](https://user-images.githubusercontent.com/123692654/215715554-a52da46a-c255-41af-9f78-2b604cb2dda3.png)

### 8. Create a snapshot of your instance to keep as a backup.

![Screenshot_261](https://user-images.githubusercontent.com/123692654/215716728-393ba62e-19ff-48fe-ab0b-c4e2eeff11ee.png)
![Screenshot_262](https://user-images.githubusercontent.com/123692654/215716730-4ce3aa14-9216-4157-9187-e5ccb8363258.png)

### 9. Create and attach a Disk_D (EBS) to your instance to add more storage space. Create and save some file on Disk_D.
![Screenshot_263](https://user-images.githubusercontent.com/123692654/215723391-e8e97a5d-de4e-421a-afcc-46fa6d5fe15f.png)
![Screenshot_264](https://user-images.githubusercontent.com/123692654/215723396-42fac58f-9834-44d2-bb19-a074164d70fa.png)
![Screenshot_265](https://user-images.githubusercontent.com/123692654/215723399-fee59f00-dd2f-4edd-bb2f-c184dbf6b319.png)
![Screenshot_266](https://user-images.githubusercontent.com/123692654/215723403-dbbfaa82-e24c-4d7e-8ede-06fdf4d1a4bd.png)
![Screenshot_268](https://user-images.githubusercontent.com/123692654/215723407-bc3f3b53-bfeb-4e60-9914-bcc0b3e9fcdc.png)

```
lsblk
sudo file -s /dev/xvdf

# Format the volume to the ext4 filesystem using the following command.
sudo mkfs -t ext4 /dev/xvdf
# Alternatively, you can also use the xfs format. You have to use either ext4 or xfs.
sudo mkfs -t xfs /dev/xvdf

# Create a directory of your choice to mount our new ext4 volume.
sudo mkdir Disc_D

# Mount the volume to “Disc_D” directory using the following command.
sudo mount /dev/xvdf Disc_D

# cd into Disc_D directory and check the disk space to validate the volume mount.
cd Disc_D
df -h

# To unmount the volume, use the unmount command as shown below..
umount /dev/xvdf

```

### 10. Launch the second instance from backup.

![Screenshot_269](https://user-images.githubusercontent.com/123692654/215732260-712d4d32-f1bc-40f7-a865-96b2b9637633.png)
![Screenshot_270](https://user-images.githubusercontent.com/123692654/215732267-b60a382c-7a37-4184-ba63-aceca19d61fa.png)
![Screenshot_271](https://user-images.githubusercontent.com/123692654/215732269-87ed22ff-d8a8-4f77-80d3-6eaf881697c5.png)

### 11. Detach Disk_D from the 1st instance and attach disk_D to the new instance.
![Screenshot_272](https://user-images.githubusercontent.com/123692654/215742211-7da55fda-65de-4adb-9e00-de4db8e38d95.png)
![Screenshot_273](https://user-images.githubusercontent.com/123692654/215742232-be1b6375-177d-4325-94b8-5f5f77a1b388.png)
![Screenshot_274](https://user-images.githubusercontent.com/123692654/215742235-f177df13-8848-4d1f-8c2c-19a9f84bba31.png)
![Screenshot_275](https://user-images.githubusercontent.com/123692654/215742237-c40d91e4-81cb-4cd5-a338-7b892a5f5659.png)

### 12 Review the 10-minute example. Explore the possibilities of creating your own domain and 
domain name for your site. Note, that Route 53 not free service. Alternatively you can free register the domain name *.PP.UA and use it.
```
sudo yum install firewalld
sudo systemctl enable firewalld
sudo reboot
sudo firewall-cmd --state

firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload


sudo yum install httpd
sudo systemctl enable httpd
sudo systemctl start httpd
```
![Screenshot_276](https://user-images.githubusercontent.com/123692654/215834337-53027866-405f-48d3-a38d-075a46417cda.png)
![Screenshot_277](https://user-images.githubusercontent.com/123692654/215834342-82abfdc8-d1bf-4194-b311-f1ddcdf8a667.png)


![Screenshot_278](https://user-images.githubusercontent.com/123692654/215841325-ce4c7660-ac01-46c4-8a52-ffa4c3c68795.png)
![Screenshot_279](https://user-images.githubusercontent.com/123692654/215841332-94933268-1de8-43de-b488-a1d80b394c6b.png)

![Screenshot_280](https://user-images.githubusercontent.com/123692654/215841579-69f04c4b-7339-457e-bc70-edca5ceebc52.png)


### 13. Launch and configure a WordPress instance with Amazon Lightsail link
![Screenshot_281](https://user-images.githubusercontent.com/123692654/215849607-15e14f86-1358-428c-9174-6b1b450d67e5.png)
![Screenshot_282](https://user-images.githubusercontent.com/123692654/215849610-842ef0f3-8a57-4536-b9c3-69c1121875d9.png)
![Screenshot_283](https://user-images.githubusercontent.com/123692654/215849627-6f4cc0f0-0580-4d77-b27a-1bc89d7ce1ec.png)
![Screenshot_284](https://user-images.githubusercontent.com/123692654/215849629-06482075-386c-4d52-b588-c019d96c6db4.png)

### 14. Review the 10-minute Store and Retrieve a File. Repeat, creating your own repository.

![Screenshot_285](https://user-images.githubusercontent.com/123692654/215851733-c0a892cf-1e16-4fde-9bec-a0cf0a4cf259.png)
![Screenshot_286](https://user-images.githubusercontent.com/123692654/215851736-d10c0cb8-69c5-4be0-9b29-d63a37222c77.png)

![Screenshot_287](https://user-images.githubusercontent.com/123692654/215851724-bff15787-b462-4faf-938a-f1e5cbb7edd8.png)
![Screenshot_288](https://user-images.githubusercontent.com/123692654/215851766-0b731b3e-213c-419f-9125-135a2f3d5b08.png)
