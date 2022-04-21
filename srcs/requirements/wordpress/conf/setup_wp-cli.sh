#!/bin/bash

if [[ ! -f wp-config.php ]]; then

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar	
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	#downloading wordpress | --path : to chose where it downloads | --user : to set Wordpress user
	#wp core download --path=${WP_PATH} --user=root
	wp core download

	#Create a wp-config.php file, replace wp user and password
	wp core config --dbname=${DB_NAME} --dbuser=${DB_USR} --dbpass=${DB_PWD} --dbhost=${DB_HOST} --path=${WP_PATH}

	#Run the installation : replace adminuser and password, name of domain
	wp core install --url='cdarrell.42.fr' --title='Inception Project' --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --allow-root

	#Create new user
	wp user create ${WP_USER} ${WP_USER_EMAIL} --role=editor --user_pass=${WP_USER_PWD} --allow-root
fi

php-fpm7 -F -R