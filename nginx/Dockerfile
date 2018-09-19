#指定使用那个基础镜像
FROM centos
MAINTAINER Dirk.Wang  510423039@qq.com
LABEL Discription="基于centos的nginx镜像" version="1.0"
WORKDIR /usr/local/src
RUN yum install -y wget
RUN wget http://nginx.org/download/nginx-1.8.0.tar.gz
RUN tar -zxvf nginx-1.8.0.tar.gz
WORKDIR nginx-1.8.0
#安装nginx所依赖的包
RUN yum -y install gcc-c++
RUN yum -y install pcre pcre-devel
RUN yum -y install zlib zlib-devel
RUN yum -y install openssl openssl-devel libssl-dev
RUN ./configure
RUN make
RUN make install
EXPOSE 80

CMD [ "/usr/sbin/init"]

