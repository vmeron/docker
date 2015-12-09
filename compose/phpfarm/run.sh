#!/bin/bash
#apt-get update && apt-get install wget -y

composer self-update

echo $PHP_VERSION



#echo "deb http://packages.dotdeb.org wheezy-php56 all" > /etc/apt/sources.list.d/php.list
#echo "deb-src http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list.d/php.list

#cd /root

#wget -q https://www.dotdeb.org/dotdeb.gpg --no-check-certificate
#apt-key add dotdeb.gpg

#apt-get update

#echo $PHP_VERSION

#apt-get install build-essential php5 php5-curl php5-gd php5-mcrypt -y

#wget https://getcomposer.org/download/1.0.0-alpha11/composer.phar
#mv /composer.phar /usr/bin/composer

#chmod +x /usr/bin/composer
#composer self-update

#echo "Composer installed"
#composer --version
