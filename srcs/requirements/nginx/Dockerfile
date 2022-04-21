FROM debian:buster

EXPOSE 443

RUN apt-get update \
	&& apt-get -y install apt-utils nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN chown -R www-data /var/www
RUN chmod -R 755 /var/www

ADD ./cert /etc/nginx/ssl

ADD conf/default /etc/nginx/sites-available/

CMD nginx -g "daemon off;"