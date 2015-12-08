FROM debian:wheezy

ENV PHP_VERSION 56

ENTRYPOINT ["/run.sh"]

RUN apt-get update && apt-get install -y wget
RUN echo "deb http://packages.dotdeb.org wheezy-php56 all" > /etc/apt/sources.list.d/php.list
RUN echo "deb-src http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list.d/php.list

RUN wget -q https://www.dotdeb.org/dotdeb.gpg --no-check-certificate
RUN apt-key add dotdeb.gpg

RUN apt-get update && apt-get -y install php5 php5-gd php5-mysql


ENTRYPOINT ["/bin/bash"]
COPY run.sh /run.sh
RUN chmod +x /run.sh
