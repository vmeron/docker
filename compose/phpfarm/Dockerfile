FROM debian:wheezy

ENV PHP_VERSION 56
ENV SVN_USER svnReadonly
ENV SVN_PASS svnReadonly

#RUN apt-get update && apt-get install -y wget
#RUN echo "deb http://packages.dotdeb.org wheezy-php$PHP_VERSION all" > /etc/apt/sources.list.d/php.list
#RUN echo "deb-src http://packages.dotdeb.org wheezy-phpPHP_VERSION all" >> /etc/apt/sources.list.d/php.list

#RUN wget -q https://www.dotdeb.org/dotdeb.gpg --no-check-certificate
#RUN apt-key add dotdeb.gpg

RUN apt-get update && apt-get -y install git \
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
    unixodbc-dev \
    freetds-dev \
    libpspell-dev \
    libsnmp-dev \
    libtidy-dev \
    libxslt1-dev \
    libmcrypt-dev

#phpfarm
WORKDIR /root
COPY custom-options.sh /root/custom-options.sh
RUN git clone git://git.code.sf.net/p/phpfarm/code phpfarm

RUN ln -s /root/custom-options.sh /root/phpfarm/src

WORKDIR /root/phpfarm/src

RUN

#Build versions
# php-2.0b12
# php-3.0.18
# php-4.4.9
# php-5.6.2

RUN ./compile.sh 4.4.9

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
