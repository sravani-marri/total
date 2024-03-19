#!/bin/bash
yum update -y
sudo yum install httpd -y
sudo service httpd start
chkconfig httpd on
echo "hi terraform welcome" > /var/www/html/index.html
