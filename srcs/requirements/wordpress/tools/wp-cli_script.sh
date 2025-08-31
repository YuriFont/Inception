#!/bin/bash
set -e

cd /var/www/html

# Espera o MySQL ficar pronto
while ! mysqladmin ping -h"${DB_HOST}" -u"${DB_USER}" -p"$(cat ${DB_PASSWORD_FILE})" --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done

# Baixa wp-cli se não existir
if [ ! -f wp-cli.phar ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
fi

# Baixa o core do WordPress só se não existir
if [ ! -f wp-config.php ]; then
  ./wp-cli.phar core download --allow-root
  ./wp-cli.phar config create \
    --dbname=${DB_NAME} \
    --dbuser=${DB_USER} \
    --dbpass=$(cat ${DB_PASSWORD_FILE}) \
    --dbhost=${DB_HOST} \
    --allow-root

  ./wp-cli.phar core install \
    --url=${WP_URL} \
    --title=${WP_TITLE} \
    --admin_user=${WP_ADMIN_USER} \
    --admin_password=$(cat ${WP_ADMIN_PASSWORD_FILE}) \
    --admin_email=${WP_ADMIN_EMAIL} \
    --allow-root
fi

# Cria o segundo usuário se não existir
if ! ./wp-cli.phar user get "${WP_USER2}" --allow-root >/dev/null 2>&1; then
  ./wp-cli.phar user create \
    "${WP_USER2}" "${WP_USER2_EMAIL}" \
    --role=${WP_USER2_ROLE} \
    --user_pass=$(cat ${WP_USER2_PASSWORD_FILE}) \
    --allow-root
fi

php-fpm8.2 -F
