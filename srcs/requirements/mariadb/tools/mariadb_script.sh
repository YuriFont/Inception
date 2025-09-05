#!/bin/bash
set -e

# Lê os secrets
DB_ROOT_PASSWORD=$(cat "$MYSQL_ROOT_PASSWORD_FILE")
DB_USER_PASSWORD=$(cat "$MYSQL_PASSWORD_FILE")

# Verificação mais robusta - se o banco de dados específico existe
if [ -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    echo "📂 Banco já inicializado, subindo normalmente..."
    exec mysqld_safe
fi

echo "📦 Inicializando diretório de dados..."
mysql_install_db --user=mysql --ldata=/var/lib/mysql

echo "🚀 Subindo mysqld temporário..."
mysqld_safe --skip-networking --socket=/tmp/mysql.sock &
pid="$!"

# Espera o servidor inicializar
until mysqladmin ping --socket=/tmp/mysql.sock >/dev/null 2>&1; do
    sleep 1
done

echo "⚙️ Configurando banco inicial..."

mysql --socket=/tmp/mysql.sock <<-EOSQL
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';

    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

# Para o mysqld temporário
mysqladmin --socket=/tmp/mysql.sock -uroot -p"${DB_ROOT_PASSWORD}" shutdown

echo "✅ Banco configurado. Iniciando servidor principal..."
exec mysqld_safe
