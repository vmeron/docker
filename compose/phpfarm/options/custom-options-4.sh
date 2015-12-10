#!/bin/sh

#--enable-fastcgi \
#--enable-force-cgi-redirect \

configoptions="\
--with-libdir=/lib/x86_64-linux-gnu \
--enable-cli \
--enable-memory-limit \
--with-regex=php \
--enable-sysvsem \
--enable-sysvshm \
--enable-sysvmsg \
--enable-track-vars \
--enable-trans-sid \
--with-bz2 \
--enable-ctype \
--without-gdbm \
--with-iconv \
--enable-filepro \
--enable-shmop \
--with-libxml-dir=/usr \
--with-kerberos=/usr \
--with-openssl-dir=/usr/lib/x86_64-linux-gnu/openssl-1.0.0 \
--enable-dbx \
--with-system-tzdata \
--with-mysql \
--with-mysqli \
--enable-pdo \
--with-pdo-mysql \
--with-pdo-sqlite \
--with-curl \
--enable-bcmath \
--enable-calendar \
--enable-exif \
--enable-ftp \
--with-gd \
--with-jpeg-dir \
--with-png-dir \
--with-freetype-dir=/usr \
--with-t1lib \
--with-zlib-dir=/usr \
--with-gettext=/usr \
--enable-mbstring \
--with-mcrypt=/usr \
--with-mhash \
--with-mime-magic \
--enable-soap \
--enable-sockets \
--with-tidy \
--enable-wddx \
--with-xsl=/usr \
--with-zip \
--with-zlib \
--enable-zip"
