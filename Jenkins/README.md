# PART 1

### 1.Install Jenkins
```
sudo apt update && sudo apt upgrade -y
sudo apt update
sudo apt install openjdk-11-jre
java -version


```

```
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  
sudo apt-get update
sudo apt-get install jenkins

```

![Screenshot_298](https://user-images.githubusercontent.com/123692654/215915040-8b4e2a2b-36bd-488e-a8f0-7b03802621fa.png)
![Screenshot_299](https://user-images.githubusercontent.com/123692654/215915316-b6fe5698-6d19-49d3-83a5-1a686b115805.png)
![Screenshot_301](https://user-images.githubusercontent.com/123692654/215915043-0034a85f-1a97-46a8-98c5-8d1c8832a29f.png)
![Screenshot_302](https://user-images.githubusercontent.com/123692654/215915044-a3c24bd7-b47a-451b-b937-8f516aecc3ba.png)
![Screenshot_303](https://user-images.githubusercontent.com/123692654/215915046-53a5c21a-1d1d-463a-9ee1-9754316139fc.png)
![Screenshot_304](https://user-images.githubusercontent.com/123692654/215915049-1cd7730d-d4f1-4704-9d27-7ad2c07a3949.png)
![Screenshot_305](https://user-images.githubusercontent.com/123692654/215915051-47426a71-54df-47e7-b867-1da734218a2c.png)
![Screenshot_306](https://user-images.githubusercontent.com/123692654/215915053-7af2853e-6710-46e2-b2e9-e516953feb10.png)


# Part 2

### 2. Simple job example in Jenkins with deploy.

![Screenshot_307](https://user-images.githubusercontent.com/123692654/215918975-72fc6f86-f86d-4997-8824-9e6470a93fb9.png)
![Screenshot_308](https://user-images.githubusercontent.com/123692654/215918981-be380bf6-717c-482e-8a94-5fa1e21e529d.png)
![Screenshot_309](https://user-images.githubusercontent.com/123692654/215918991-0f1842e0-1790-42d6-bb5b-75ea924fef84.png)


Deploy from Jenkins MAIN Server to Jenkins Agent over SSH
![Screenshot_309](https://user-images.githubusercontent.com/123692654/215918991-0f1842e0-1790-42d6-bb5b-75ea924fef84.png)
![Screenshot_310](https://user-images.githubusercontent.com/123692654/215919537-0e648361-f57e-44f5-9188-91e5c326a2b9.png)


Simple job example in Jenkins with deploy.Establish SSH connection without login/password
```
sudo systemctl status ssh
sudo ufw allow 22/tcp 
ssh ubuntu@ip-172-31-44-71 -i ********irelaand.pem

```
![Screenshot_309](https://user-images.githubusercontent.com/123692654/215923664-8c262676-06a4-4eb5-82b4-eeb5bc365a51.png)
![Screenshot_310](https://user-images.githubusercontent.com/123692654/215923667-96c1797e-0d04-458e-b755-2278c295b95f.png)
![Screenshot_311](https://user-images.githubusercontent.com/123692654/215923671-9847950b-bcb9-40c7-9eb6-af92bcc96a2c.png)



Simple job example in Jenkins with deploy.Establish privileges for/var/www
after install apache server 

![Screenshot_312](https://user-images.githubusercontent.com/123692654/215923716-d91f8220-bed3-4e39-ac1a-ede091c16eae.png)
![Screenshot_313](https://user-images.githubusercontent.com/123692654/215923734-84c1a54b-cd05-4c2b-91d3-c5afa365a820.png)
![Screenshot_314](https://user-images.githubusercontent.com/123692654/215923756-4c889171-1ffc-48f5-b4d1-4047bfe73e31.png)
![Screenshot_315](https://user-images.githubusercontent.com/123692654/215923757-048ebda3-390e-4f3b-af91-45adfabc939c.png)



sudo apt update
sudo apt install apache2
sudo ufw app list
sudo ufw allow 'Apache'
sudo ufw status
sudo systemctl status apache2

```
sudo chown -R ubuntu:www-data /var/www
sudo find /var/www -type d -exec chmod 2750 {} \+
sudo find /var/www -type f -exec chmod 640 {} \+

sudo chgrp -R www-data /var/www
sudo find /var/www -type d -exec chmod g+rx {} +
sudo find /var/www -type f -exec chmod g+r {} +
sudo chown -R ubuntu /var/www/
sudo find /var/www -type d -exec chmod u+rwx {} +
sudo find /var/www -type f -exec chmod u+rw {} +
sudo find /var/www -type d -exec chmod g+s {} +
sudo chmod -R o-rwx /var/www/

```

### 3. Simple CI/CD pipeline example