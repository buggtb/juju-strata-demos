#!/bin/bash
# Import Script for MySQL database

WORKLOAD=mysql
cd /home/ubuntu
sudo cp /var/lib/mysql/mysql.passwd ./
sudo chmod +r /home/ubuntu/mysql.passwd

if [ -f /home/ubuntu/foodmart.${WORKLOAD}.tar.gz ]
then 
	tar xfz /home/ubuntu/foodmart.${WORKLOAD}.tar.gz
	sleep 1
	rm -f /home/ubuntu/foodmart.${WORKLOAD}.tar.gz
fi

mysql -u root -p`cat /var/lib/mysql/mysql.passwd` < foodmart.sql

mysql -u root -p`sudo cat /var/lib/mysql/mysql.passwd` -e "grant all privileges on foodmart_key.* to 'spagobi'@'%' identified by 'SpagoBI';"

echo "All done. See yah!"
