#!/bin/bash

sudo yum update -y 
sudo yum install httpd -y
setenforce 0 
sudo systemctl enable httpd
sudo echo "Demo-Website" >> /var/www/html/index.html
sudo chown -R apache:apache /var/www/html
sudo systemctl restart httpd

