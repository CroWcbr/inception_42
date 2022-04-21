FROM alpine:3

RUN apk add --update wget curl bash util-linux openrc mysql-client git\
					php \
					php-fpm \
					php-iconv \
					php-json \
					php-mysqli \
					php-phar

COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

WORKDIR /var/www/html/wordpress

COPY conf/setup_wp-cli.sh ./

CMD	/bin/bash setup_wp-cli.sh

EXPOSE 9000