#!/bin/sh
PHP_FCGI_CHILDREN=3
export PHP_FCGI_CHILDREN
PHP_FCGI_MAX_REQUESTS=5000
export PHP_FCGI_MAX_REQUESTS
exec /root/phpfarm/inst/bin/current-bin/php-cgi
