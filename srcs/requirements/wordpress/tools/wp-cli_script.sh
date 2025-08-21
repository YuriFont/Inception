#!/bin/bash
set -euo pipefail

# Helper para ler VAR ou VAR_FILE (secrets)
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

WP_DB_NAME="${DB_NAME:-wordpress}"
WP_DB_USER="${DB_USER:-wpuser}"
WP_DB_PASS="$(read_secret DB_PASSWORD)"
WP_DB_HOST="${DB_HOST:-mariadb}"

WP_URL="${WP_URL:-https://$SERVER_NAME}"
WP_TITLE="${WP_TITLE:-inception}"

# Admin do WP (NÃO pode conter 'admin'/'administrator' em nenhuma variação)
WP_ADMIN_USER="${WP_ADMIN_USER:?defina WP_ADMIN_USER sem 'admin'}"
if [[ "$WP_ADMIN_USER" =~ [Aa]dmin ]]; then
  echo "Erro: WP_ADMIN_USER não pode conter 'admin'/'Admin'..." >&2
  exit 1
fi
WP_ADMIN_PASS="$(read_secret WP_ADMIN_PASSWORD)"
WP_ADMIN_EMAIL="${WP_ADMIN_EMAIL:-admin@example.com}"

# Segundo usuário do WP
WP_USER2="${WP_USER2:-editoruser}"
if [[ "$WP_USER2" =~ [Aa]dmin ]]; then
  echo "Erro: WP_USER2 não pode conter 'admin'..." >&2
  exit 1
fi
WP_USER2_PASS="$(read_secret WP_USER2_PASSWORD)"
WP_USER2_EMAIL="${WP_USER2_EMAIL:-user2@example.com}"
WP_USER2_ROLE="${WP_USER2_ROLE:-editor}"

cd /var/www/html

# Instala WP-CLI em /usr/local/bin/wp (fica limpo)
if ! command -v wp >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
  chmod +x /usr/local/bin/wp
fi

# Se não houver wp-config.php, provisiona
if [[ ! -f wp-config.php ]]; then
  wp core download --allow-root
  wp config create \
    --dbname="$WP_DB_NAME" \
    --dbuser="$WP_DB_USER" \
    --dbpass="$WP_DB_PASS" \
    --dbhost="$WP_DB_HOST" \
    --allow-root
fi

# Instala site se ainda não instalado
if ! wp core is-installed --allow-root; then
  wp core install \
    --url="$WP_URL" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASS" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email \
    --allow-root

  # Cria segundo usuário (total = 2 usuários no WP)
  if ! wp user get "$WP_USER2" --field=ID --allow-root >/dev/null 2>&1; then
    wp user create "$WP_USER2" "$WP_USER2_EMAIL" \
      --role="$WP_USER2_ROLE" \
      --user_pass="$WP_USER2_PASS" \
      --allow-root
  fi
fi

# Sobe o PHP-FPM em foreground (sem hacks)
exec php-fpm8.2 -F
