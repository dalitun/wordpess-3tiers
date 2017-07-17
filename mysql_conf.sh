#!/bin/bash
db_rootpassword=$1
db_host=$2
db_name=$3
 while ! nc -z $db_host 8635
     do
       sleep 0.1
       echo "wait mysql"
 done


 cat << EOF | mysql -u root --password=$db_rootpassword -h $db_host --port=8635
 CREATE DATABASE IF NOT EXISTS $db_name;
 FLUSH PRIVILEGES;
 EXIT
EOF
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sudo sed -i s/database_name_here/$db_name/ /var/www/html/wp-config.php
sudo sed -i s/username_here/root/ /var/www/html/wp-config.php
sudo sed -i s/password_here/$db_rootpassword/ /var/www/html/wp-config.php
sudo sed -i s/localhost/$db_host:8635/ /var/www/html/wp-config.php
