#!/bin/sh
set -e

if [ -z "$PORT" ]; then
  echo "ERROR: PORT is not set"
  exit 1
fi

echo "Starting Apache on port $PORT"

# Substitui qualquer Listen 80 ou 0.0.0.0:80
sed -i "s/Listen .*/Listen ${PORT}/" /etc/apache2/ports.conf

# Substitui qualquer VirtualHost :80
sed -i "s/<VirtualHost \*:80>/<VirtualHost *:${PORT}>/" \
  /etc/apache2/sites-available/000-default.conf

exec apache2-foreground
