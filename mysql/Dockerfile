FROM centos
MAINTAINER leorusLao  495325806@qq.com
LABEL Discription="基于centos的mysql镜像" version="1.0"
WORKDIR /usr/local/src

RUN yum install -y initscripts

RUN yum install -y wget

#下载mysql的repo源
RUN wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

#安装mysql-community-release-el7-5.noarch.rpm包
RUN rpm -ivh mysql-community-release-el7-5.noarch.rpm

#安装mysql
RUN yum install -y mysql-server

#初始化mysql
COPY init.sh /usr/local/src/init.sh

RUN chmod +x /usr/local/src/init.sh

RUN echo '/usr/local/src/init.sh' >> /etc/rc.d/rc.local

RUN chmod +x /etc/rc.d/rc.local

EXPOSE 3306

#CMD [ "sh","/usr/local/src/mysql/init.sh"]
CMD [ "/usr/sbin/init" ]


