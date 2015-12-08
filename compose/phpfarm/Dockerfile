FROM debian:wheezy

ENV PHP_VERSION 56

COPY run.sh /
RUN chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
