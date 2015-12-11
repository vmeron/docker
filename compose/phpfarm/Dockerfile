FROM debian:wheezy

#@TODO : Find another way to do this more securely
ARG SVN_USER
ARG SVN_PASS

ENV SVN_USER ${SVN_USER:-user}
ENV SVN_PASS ${SVN_PASS:-pass}

RUN apt-get update \
    && apt-get install subversion -y \
    && echo "svn co --username $SVN_USER --password $SVN_PASS https://svn.dbm-agence.com/drupal-06-2011/trunk/drupal7 /root/drupal7"
