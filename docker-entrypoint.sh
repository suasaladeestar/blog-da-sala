#!/bin/sh
set -e

# Garante PORT
if [ -z "$PORT" ]; then
  echo "PORT not set, defaulting to 80"
  PORT=80
fi

echo "Starting Apache on port $PORT"

# Atualiza Apache para escutar a porta do Railway (runtime!)
sed -i "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf
sed -i "s/:80/:${PORT}/" /etc/apache2/sites-available/000-default.conf

exec apache2-foreground
