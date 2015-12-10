FROM debian:wheezy

ENV PHP_VERSION 56
ENV SVN_USER svnReadonly
ENV SVN_PASS svnReadonly

COPY apt/contrib.list /etc/apt/sources.list.d/contrib.list
RUN apt-get update && apt-get install -y wget
#RUN echo "deb http://packages.dotdeb.org wheezy-php$PHP_VERSION all" > /etc/apt/sources.list.d/php.list
#RUN echo "deb-src http://packages.dotdeb.org wheezy-phpPHP_VERSION all" >> /etc/apt/sources.list.d/php.list

#RUN wget -q https://www.dotdeb.org/dotdeb.gpg --no-check-certificate
#RUN apt-key add dotdeb.gpg

RUN apt-get update && apt-get -y install apache2 git-core \
    php5 \
    subversion \
    curl \
    build-essential \
    libxml2-dev \
    libpcre3-dev \
    libbz2-dev \
    libcurl4-openssl-dev \
    libjpeg-dev \
    libpng12-dev \
    libxpm-dev \
    libfreetype6-dev \
    libmysqlclient-dev \
    postgresql-server-dev-9.1 \
    libt1-dev \
    libgd2-xpm-dev \
    libgmp-dev \
    libsasl2-dev \
    libmhash-dev \
    libzip-dev \
    libzzip-dev \
    unixodbc-dev \
    freetds-dev \
    libpspell-dev \
    libsnmp-dev \
    libtidy-dev \
    libxslt1-dev \
    libmcrypt-dev \
    libssl-dev \
    libsslcommon2-dev \
    flex


#phpfarm
WORKDIR /root

##RUN git clone git://git.code.sf.net/p/phpfarm/code phpfarm
RUN git clone https://github.com/cweiske/phpfarm.git phpfarm
#RUN git clone https://github.com/yfix/phpfarm.git phpfarm

COPY options/custom-options-4.sh /root/custom-options-4.sh
COPY options/custom-options-5.sh /root/custom-options-5.sh

RUN ln -s /root/custom-options-4.sh /root/phpfarm/src
RUN ln -s /root/custom-options-5.sh /root/phpfarm/src
RUN ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libpng.so /usr/lib

#Build versions
# php-2.0b12
# php-3.0.18
# php-4.4.9
# php-5.5.10
# php-5.6.2

WORKDIR /root/phpfarm/src
#RUN ./compile.sh 4.4.9 || :
#RUN ./compile.sh 5.6.2 || :
RUN ./compile.sh 5.5.10 || :

WORKDIR /root/phpfarm
RUN rm -rf src && apt-get clean --purge

#Setup apache2
WORKDIR /root
COPY apache/php-cgi-wrapper.sh php-cgi-wrapper.sh
COPY apache/vhosts/drupal /etc/apache2/sites-available/drupal
COPY apache/conf.d/cgi.conf /etc/apache2/conf.d/cgi.conf

RUN a2ensite drupal \
    && a2dissite default \
    && a2enmod rewrite fastcgi vhost_alias && service apache2 restart

#Composer
#RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
#RUN mv composer.phar /usr/bin/composer

#Drush
#RUN git clone https://github.com/drush-ops/drush.git /usr/local/src/drush \
#&& cd /usr/local/src/drush \
#&& git checkout 8.0.1 \
#&& ln -s /usr/local/src/drush/drush /usr/bin/drush \
#&& composer install


#ENTRYPOINT ["/bin/bash"]
#COPY run.sh /run.sh
#RUN chmod +x /run.sh
