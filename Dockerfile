FROM php:8.2-apache

# Instala extensões necessárias para WordPress
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Habilita mod_rewrite (WordPress precisa)
RUN a2enmod rewrite

# Copia os arquivos do WordPress
COPY . /var/www/html/

# Ajusta permissões
RUN chown -R www-data:www-data /var/www/html
