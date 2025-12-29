FROM php:8.2-apache

# Garante que apenas um MPM esteja ativo
RUN a2dismod mpm_event || true \
 && a2dismod mpm_worker || true \
 && a2enmod mpm_prefork

# Instala extensões necessárias para WordPress
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Habilita mod_rewrite
RUN a2enmod rewrite

# Copia arquivos do WordPress
COPY . /var/www/html/

# Permissões
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
