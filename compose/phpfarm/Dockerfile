FROM debian:wheezy

#@TODO : Find another way to do this more securely
RUN apt-get update -qq \
    && apt-get install -qq wget \
    && wget -q -O - http://opensource.wandisco.com/wandisco-debian.gpg | apt-key add -

COPY apt/subversion.list /etc/apt/sources.list.d/subversion.list
COPY apt/contrib.list /etc/apt/sources.list.d/contrib.list
COPY options/custom-options-4.sh /root/custom-options-4.sh
COPY options/custom-options-5.sh /root/custom-options-5.sh
COPY run.sh /run.sh

RUN apt-get update -qq && apt-get install -qq apache2 git-core \
    libapache2-mod-fastcgi \
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
    flex \
    && apt-get clean --purge -y \
    && apt-get autoremove --purge -y -qq

#phpfarm
WORKDIR /root

##RUN git clone git://git.code.sf.net/p/phpfarm/code phpfarm
RUN git clone https://github.com/cweiske/phpfarm.git phpfarm
#RUN git clone https://github.com/yfix/phpfarm.git phpfarm

RUN ln -s /root/custom-options-4.sh /root/phpfarm/src \
    && ln -s /root/custom-options-5.sh /root/phpfarm/src \
    && ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib \
    && ln -s /usr/lib/x86_64-linux-gnu/libpng.so /usr/lib \
    && cd phpfarm/src \
    && ./compile.sh 5.5.10 \
    || cd ../../ \
    && rm -rf ./phpfarm/src \
    && apt-get remove build-essential --purge -y -qq

#Build versions
# php-2.0b12
# php-3.0.18
# php-4.4.9
# php-5.5.10
# php-5.6.2

#RUN ./compile.sh 4.4.9 || :
#RUN ./compile.sh 5.6.2 || :

#Setup apache2
COPY apache/php-cgi-wrapper.sh php-cgi-wrapper.sh
COPY apache/vhosts/drupal.conf /etc/apache2/sites-available/drupal.conf
COPY apache/conf.d/cgi.conf /etc/apache2/conf.d/cgi.conf

RUN chmod +x php-cgi-wrapper.sh \
    && a2ensite drupal \
    && a2dissite 000-default \
    && a2enmod rewrite fastcgi actions vhost_alias && service apache2 restart

#Fetch drupal install
ARG SVN_USER
ARG SVN_PASS
ARG SVN_REPO

RUN svn co --trust-server-cert --non-interactive $SVN_REPO /var/www/drupal7 --username $SVN_USER --password $SVN_PASS \
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


RUN chmod +x /run.sh

ENTRYPOINT ["/bin/bash"]
VOLUME /drupal7

#Ports
EXPOSE 80

#Envs
ENV PHP_VERSION 5.6.2
