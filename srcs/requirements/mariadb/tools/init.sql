#!/bin/bash
set -euo pipefail

read_secret() {
  local var="$1" file_var="${1}_FILE"
  local val="${!var-}"
  local file="${!file_var-}"
  if [[ -n "${val}" && -n "${file}" ]]; then
    echo "Erro: tanto $var quanto $file_var estão definidos" >&2
    exit 1
  fi
  if [[ -n "${val}" ]]; then
    echo -n "$val"
  elif [[ -n "${file}" ]]; then
    cat "$file"
  else
    echo "Erro: $var (ou $file_var) não definido" >&2
    exit 1
  fi
}

DB_NAME="${MARIADB_DATABASE:-wordpress}"
DB_USER="${MARIADB_USER:-wpuser}"
DB_PASS="$(read_secret MARIADB_PASSWORD)"
ROOT_PASS="$(read_secret MARIADB_ROOT_PASSWORD)"

DATADIR="/var/lib/mysql"

# Inicializa datadir se vazio
if [ ! -d "$DATADIR/mysql" ]; then
  echo "Inicializando datadir..."
  mariadb-install-db --user=mysql --datadir="$DATADIR" --auth-root-authentication-method=normal >/dev/null

  # Sobe server temporário sem rede externa
  mysqld --user=mysql --datadir="$DATADIR" --skip-networking --socket=/run/mysqld/mysqld.sock &
  pid="$!"

  # Espera ficar pronto
  for i in {1..30}; do
    mysqladmin --socket=/run/mysqld/mysqld.sock ping && break
    sleep 1
  done

  # Configura root e DB/app user (sem GRANT global)
  mysql --protocol=socket --socket=/run/mysqld/mysqld.sock <<-SQL
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';
    CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
    GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
    FLUSH PRIVILEGES;
SQL

  # Encerra temporário
  mysqladmin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -p"${ROOT_PASS}" shutdown
  wait "$pid"
fi

# Sobe definitivo em foreground
exec mariadbd --user=mysql --datadir="$DATADIR"
