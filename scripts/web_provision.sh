sudo apt update
sudo apt install apache2 -y
sudo apt install php -y
sudo apt-get install php-mysqli -y
sudo apt install mysql-client -y

sudo sed -i 's/;extension=mysqli/extension=mysqli/' /etc/php/8.1/apache2/php.ini
sudo sed -i 's/;extension=mbstring/extension=mbstring/' /etc/php/8.1/apache2/php.ini
sudo sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 100M/g' /etc/php/8.1/apache2/php.ini

#Sartori's MVC Fix
sudo a2enmod rewrite
sudo sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

sudo systemctl restart apache2