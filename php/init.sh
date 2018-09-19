#!/bin/bash

groupadd www
useradd -g www www

sed -i 's/127.0.0.1/0.0.0.0/g' /usr/local/php/etc/php-fpm.d/www.conf

cd /etc/init.d

./php-fpm start




