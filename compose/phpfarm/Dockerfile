FROM debian:wheezy

#@TODO : Find another way to do this more securely
ARG SVN_USER
ARG SVN_PASS

COPY apt/contrib.list /etc/apt/sources.list.d/contrib.list

RUN apt-get update -qq && apt-get install -qq wget apache2 git-core \
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
COPY apache/vhosts/drupal.conf /etc/apache2/sites-available/drupal.conf
COPY apache/conf.d/cgi.conf /etc/apache2/conf.d/cgi.conf

RUN chmod +x php-cgi-wrapper.sh \
    && apt-get install -qq libapache2-mod-fastcgi \
    && a2ensite drupal \
    && a2dissite 000-default \
    && a2enmod rewrite fastcgi actions vhost_alias && service apache2 restart

#Fetch drupal install
RUN svn co $SVN_DRUPAL_REPO /var/www/drupal7 --username $SVN_USER --password $SVN_PASS \
    && rm -rf /var/www/drupal7/default
RUN mkdir /var/www/drupal7/sites/local.com \
    && ln -s /var/www/drupal7/sites/local.com /drupal7

#Composer
#RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
#RUN mv composer.phar /usr/bin/composer

#Drush
#RUN git clone https://github.com/drush-ops/drush.git /usr/local/src/drush \
#&& cd /usr/local/src/drush \
#&& git checkout 8.0.1 \
#&& ln -s /usr/local/src/drush/drush /usr/bin/drush \
#&& composer install

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/bin/bash"]
VOLUME /drupal7

#Ports
EXPOSE 80

#Envs
ENV PHP_VERSION 5.6.2
