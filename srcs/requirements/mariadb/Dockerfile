FROM debian:buster

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y mariadb-server

COPY conf/setup.sql ./

RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf \
	&& service mysql start && mysql < setup.sql

CMD	/usr/bin/mysqld_safe