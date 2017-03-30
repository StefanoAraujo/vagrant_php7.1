#!/bin/bash
mensagem = "VAGRANT MENSAGEM:"
echo "***************************************************************"
echo "***************************************************************"
echo "*** Iniciando instalacao do ambiente de Desenvolvimento PHP ***"
echo "***       -PHP 7.1                                           ***"
echo "***       -MySQL 5.5                                         ***"
echo "***       -Git                                               ***"
echo "***       -PhpMyAdmin                                        ***"
echo "***       -Composer                                          ***"
echo "***       -cURL                                              ***"
echo "***       -Vim                                               ***"
echo "***       -Redis                                             ***"
echo "***************************************************************"
echo "***************************************************************"

echo "$mensagem Atualizando lista de pacotes"
sudo apt-get update

echo "$mensagem Definindo Senha padrao para o MySQL e suas ferramentas"

DEFAULTPASS="vagrant"
sudo debconf-set-selections <<EOF
mysql-server	mysql-server/root_password password $DEFAULTPASS
mysql-server	mysql-server/root_password_again password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/app-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/admin-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/password-confirm password $DEFAULTPASS
dbconfig-common	dbconfig-common/app-password-confirm password $DEFAULTPASS
phpmyadmin		phpmyadmin/reconfigure-webserver multiselect apache2
phpmyadmin		phpmyadmin/dbconfig-install boolean true
phpmyadmin      phpmyadmin/app-password-confirm password $DEFAULTPASS 
phpmyadmin      phpmyadmin/mysql/admin-pass     password $DEFAULTPASS
phpmyadmin      phpmyadmin/password-confirm     password $DEFAULTPASS
phpmyadmin      phpmyadmin/setup-password       password $DEFAULTPASS
phpmyadmin      phpmyadmin/mysql/app-pass       password $DEFAULTPASS
EOF

echo "$mensagem Instalando pacotes basicos"
sudo apt-get install software-properties-common vim curl python-software-properties git-core --assume-yes --force-yes

echo "$mensagem Adicionando repositorio do pacote PHP"
sudo add-apt-repository ppa:ondrej/php

echo "$mensagem Atualizando lista de pacotes"
sudo apt-get update

echo "$mensagem Instalando MySQL, Phpmyadmin e alguns outros modulos"
sudo apt-get install mysql-server mysql-client phpmyadmin --assume-yes --force-yes
sudo mysql_secure_installation

echo "$mensagem Instalando PHP, Apache e alguns modulos"
sudo apt-get install php7.1 php7.1-common --assume-yes --force-yes
sudo apt-get install php7.1-cli libapache2-mod-php7.1 php7.1-mysql php7.1-curl php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring zip unzip --assume-yes --force-yes

echo "$mensagem Habilitando o PHP 7.1"
sudo a2dismod php5
sudo a2enmod php7.1

echo "$mensagem Habilitando mod-rewrite do Apache"
sudo a2enmod rewrite

echo "$mensagem Reiniciando Apache"
sudo service apache2 restart

echo "$mensagem Baixando e Instalando Composer"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "$mensagem Baixando e Instalando Ionic"
sudo apt-get install nodejs
sudo apt-get install npm
sudo apt-get install build-essential libssl-dev
sudo npm install -g cordova
sudo apt-get install ia32-libs
sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0
sudo npm install -g ionic

echo "$mensagem Instalando Banco NoSQL -> Redis <-" 
sudo apt-get install redis-server --assume-yes
sudo apt-get install php7.1-redis --assume-yes

echo "$mensagem Instalando Banco Postgres" 
sudo apt-get install postgresql postgresql-contrib

# Instale apartir daqui o que você desejar 

echo "$mensagem [OK] --- Ambiente de desenvolvimento concluido ---"
