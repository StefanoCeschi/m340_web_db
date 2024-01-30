sudo apt-get update
sudo apt-get install -y mysql-server

sudo tee -a /etc/mysql/mysql.conf.d/mysqld.cnf <<EOF
  [mysqld]
  bind-address = 10.10.20.11
EOF

sudo mysql -e "CREATE USER IF NOT EXISTS 'webboh'@'10.10.20.10' IDENTIFIED BY 'Password&1'";
sudo mysql -e "GRANT SELECT, UPDATE, DELETE, INSERT ON gestionaleband.* TO 'webboh'@'10.10.20.10'";

sudo mysql < /home/vagrant/dbConfig/db.sql

sudo systemctl restart mysql
