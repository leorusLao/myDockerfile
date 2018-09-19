#!/bin/bash

#/usr/sbin/init

service mysql start

sleep 3

mysql <<EOF

#设置密码
use mysql;
update user set password=password('password') where user='root';
grant all privileges on *.* to 'root'@'%' identified by 'password' with grant option;
FLUSH PRIVILEGES;


EOF

service mysql restart

