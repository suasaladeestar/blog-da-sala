FROM php:8.2-apache

# Instala extensões do WordPress
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Habilita rewrite
RUN a2enmod rewrite

# Copia apenas o WordPress
COPY wp-admin /var/www/html/wp-admin
COPY wp-content /var/www/html/wp-content
COPY wp-includes /var/www/html/wp-includes
COPY *.php /var/www/html/

RUN chown -R www-data:www-data /var/www/html
