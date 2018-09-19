#指定使用那个基础镜像
FROM centos
MAINTAINER leorusLao  495325806@qq.com
LABEL Discription="基于centos的php镜像" version="1.0"

#下载php7
WORKDIR /usr/local/src
RUN yum install -y wget
RUN wget -O php7.tar.gz http://cn2.php.net/get/php-7.1.5.tar.gz/from/this/mirror
RUN tar -zxvf php7.tar.gz
WORKDIR php-7.1.5

#扩展包更新包
RUN yum install -y epel-release
RUN yum update -y

#安装php7所依赖的包
RUN yum -y install gcc-c++
RUN yum install -y libxml2 libxml2-devel openssl openssl-devel bzip2 bzip2-devel libcurl libcurl-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel gmp gmp-devel libmcrypt libmcrypt-devel readline readline-devel libxslt libxslt-devel

#编译配置
RUN ./configure  --prefix=/usr/local/php  --with-config-file-path=/usr/local/php/etc  --enable-fpm  --with-fpm-user=www  --with-fpm-group=www  --enable-inline-optimization  --disable-debug  --disable-rpath  --enable-shared  --enable-soap  --with-libxml-dir  --with-xmlrpc  --with-openssl  --with-mcrypt  --with-mhash  --with-pcre-regex  --with-sqlite3  --with-zlib  --enable-bcmath  --with-iconv  --with-bz2  --enable-calendar  --with-curl  --with-cdb  --enable-dom  --enable-exif  --enable-fileinfo  --enable-filter  --with-pcre-dir  --enable-ftp  --with-gd  --with-openssl-dir  --with-jpeg-dir  --with-png-dir  --with-zlib-dir  --with-freetype-dir  --enable-gd-native-ttf  --enable-gd-jis-conv  --with-gettext  --with-gmp  --with-mhash  --enable-json  --enable-mbstring  --enable-mbregex  --enable-mbregex-backtrack  --with-libmbfl  --with-onig  --enable-pdo  --with-mysqli=mysqlnd  --with-pdo-mysql=mysqlnd  --with-zlib-dir  --with-pdo-sqlite  --with-readline  --enable-session  --enable-shmop  --enable-simplexml --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-libxml-dir --with-xsl --enable-zip --enable-mysqlnd-compression-support --with-pear --enable-opcache

#正式安装
RUN make && make install

#配置环境变量
RUN echo 'PATH=$PATH:/usr/local/php/bin' >> /etc/profile
RUN echo 'export PATH' >> /etc/profile
RUN source /etc/profile

#配置php-fpm
RUN cp php.ini-production /usr/local/php/etc/php.ini
RUN cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
RUN cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf
RUN cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
RUN chmod +x /etc/init.d/php-fpm


#初始化php
COPY init.sh /usr/local/src/init.sh

RUN chmod +x /usr/local/src/init.sh

RUN echo '/usr/local/src/init.sh' >> /etc/rc.d/rc.local

RUN chmod +x /etc/rc.d/rc.local


EXPOSE 9000

CMD [ "/usr/sbin/init"]
