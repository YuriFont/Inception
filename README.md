# Inception

Link para penúltima versão estável do Debian: https://cdimage.debian.org/cdimage/archive/12.7.0/amd64/iso-dvd/

## Criando a VM

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/deb34cd7-4144-4020-aa88-0f0cdcefb1fe" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/f612f76d-5ba3-4b88-85ee-9026e4d9eb22" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/35348b9c-c1d2-490f-8251-587cafbc782c" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/8039e80f-4d28-44e5-a6c5-d010a30aa39d" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/afe03d28-0400-46fb-ad6a-9c19426471c4" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/5b233951-2faf-40ef-8e64-b907a1210bb3" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/f149b71a-cbd2-443b-b2d4-c311a3e86ac2" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/eb637b59-44f3-4839-b8fd-6fe140c1f514" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/b3dd8c34-6d19-4397-969a-afd7697f280d" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/16e7fcfe-1da4-4223-b805-9931147ca14d" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/9fa60e49-f13e-4df8-aaaa-614dfe04a6c3" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/65557638-2864-4595-9b26-0975b8639518" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/dd5cfaf3-d5e0-4adb-adc4-a91bb59b0c74" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/679242ea-809d-42c9-a4b4-90737c18046e" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/bf01117a-4080-49fd-bd7d-9da5fbae2f60" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/8b6292aa-d55a-4668-a35e-9f1536618744" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/a89a84c7-2d3c-4283-b1b5-b7af329cb04b" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/1d8a3139-63de-4e9f-9a2c-9f6b3ca886e7" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/e29f055d-4839-4174-92fc-fa72c2566797" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/727a3371-60bc-4757-a1be-a2e6c63e6655" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/90f9cbad-8e4c-404f-b77b-7f26eb97956a" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/27ff5472-fdf3-40e4-9019-82d141953092" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/ae9dd95c-c932-4a96-a1b9-a7f64b386370" />

<p>Aqui antes de clicar em continuar verifique se o "Device 0" está realmente sem a imagem .iso. Dessa forma quando reiniciar ele não voltara ao menu de instalação e sim iniciará da forma correta. Se ainda estiver com a ISO remova.</p>

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/96c920b5-6c63-48fb-8e8b-b2901e0b53fa" />

<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/53be3131-1c1f-4ed8-ac44-6f935126473b" />


Se tudo ocorrer bem o sistema será reiniciado. Vamos agora para as configurações antes de iniciar o projeto.

## Configurando sudo e atualizando pacotes

Abra o terminal e use os comandos:

su

sudo vi /etc/apt/sources.list

Comente a primeira linha</br>
<img width="551" height="328" alt="image" src="https://github.com/user-attachments/assets/27eba4be-9640-4c4b-be18-f09193f827f5" />


Cole isso em /etc/apt/sources.list para conseguir usar o comando apt da forma correta e instalar os pacotes:

```
deb http://deb.debian.org/debian/ bookworm main non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm main non-free-firmware

deb http://security.debian.org/debian-security bookworm-security main non-free-firmware
deb-src http://security.debian.org/debian-security bookworm-security main non-free-firmware

# bookworm-updates, to get updates before a point release is made;
# see https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_updates_and_backports
deb http://deb.debian.org/debian/ bookworm-updates main non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-updates main non-free-firmware
```

Agora atualize os pacotes: sudo apt update && apt upgrade

### Colocando o usuário padrão no grupo sudo

Entre no super usuário:

su

E utilize esse comando:

sudo vim /etc/sudoers

Você encontrará um linha como essa:</br>

<img width="387" height="74" alt="image" src="https://github.com/user-attachments/assets/5139327a-cbd5-4b39-a5cf-0a9af39a6803" />

Adicione logo abaixo uma linha com o seu usuário:

<usuário> ALL=(ALL:ALL) ALL

Agora o seu usuário poderá usar o comando sudo

## Instalando o SSH

Essa parte é opcional. Porém eu acho mais fácil ir configurando o projeto pelo terminal da máquina real do que ficar usando a Vm em si.

Instale o OpenSSH:
```
sudo apt update
sudo apt install openssh-server -y
```
Verifique se está rodando:
```
sudo systemctl status ssh

#Para ativar
sudo systemctl start ssh

#Para configurar a inicialização junto ao sistema
sudo systemctl enable ssh
```

Edite o arquivo de configuração:

sudo vim /etc/ssh/sshd_config

Depois de abrir o arquivo descomente a porta e altere para uma da sua escolha ex: 4242
</br><img width="517" height="337" alt="image" src="https://github.com/user-attachments/assets/bfdaa23a-1a20-4b7b-a4c9-91fd14c4e1fc" />

Agora vamos acessar a sudo vi /etc/ssh/ssh_config/ e também descomentar a porta</br><img width="521" height="397" alt="image" src="https://github.com/user-attachments/assets/3094628c-f757-4a3f-a6e3-63eaa046cea2" />

Agora vamos adicionar a porta na VM</br><img width="507" height="336" alt="image" src="https://github.com/user-attachments/assets/f6045a51-6acd-457d-8848-1c7fafc40e79" />
<img width="586" height="381" alt="image" src="https://github.com/user-attachments/assets/8435638a-b09f-4e0c-b05e-62c96afe4164" />

Reinicie o serviço:

```
sudo systemctl restart ssh
```

Agora é só conectar usando ssh yufonten@localhost -p 4242


## Instalando docker e docker compose v2

```
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Adicionando o usuário no gruopo do docker
sudo usermod -aG docker $USER

newgrp docker

### Verifique as versões
docker --version

docker compose version

### Binding para que o localhost se resolva com o endereço pedido no subject
Dentro de /etc/hosts deve ter isso:

<img width="713" height="185" alt="image" src="https://github.com/user-attachments/assets/c8a9a37e-c76d-47b1-a98b-ae525c308996" />


## Criando os arquivos necessários e dando permissões a eles

Criei um shell script que cria os arquivos que aparecem no subject, ainda não sei muito bem se podemos usar mais pastas do que tem descrido lá. De qualquer forma, esse escript vai criar as pastas e arquivos que estão descritos e dar a permissão necessária a eles.

Basta ir para a home do seu usuário e criar o diretório inception:
```
mkdir inception
```

Depois, já dentro do diretório iremos criar o script create_structure.sh:
```
vim create_structure.sh
sudo chmod +x create_structure.sh
./create_structure.sh
```

Obs.: Lembre de trocar o nome das variáveis USER e GROUP para o nome do seu usuário.

Dentro da pasta secrets deve ter arquivos .txt contendo apenas as senhas usadas no projeto.

Ex.: db_root_password.txt,  wp_admin_password.txt,  wp_db_password.txt,  wp_user2_password.txt


Seu .env deve ter algo parecido com isso:

<img width="622" height="463" alt="image" src="https://github.com/user-attachments/assets/0f098a57-e610-4d9f-ac41-6444f6d8b5e2" />


Dentro da pasta secrets usei esses arquivos:

<img width="1046" height="51" alt="image" src="https://github.com/user-attachments/assets/b8ceb365-44f2-4f06-af78-961a3af3c2b3" />

## Explicação dos arquivos

### Docker Compose

#### 📦 Serviços:
#### Nginx -

Build: diretório requirements/nginx/. → você deve ter um Dockerfile lá que instala/configura Nginx.

Args: passa SERVER_NAME (ex.: meusite.com) já na build.

Imagem: chamada nginx (imagem custom sua, não a oficial).

depends_on: sobe só depois de WordPress e MariaDB estarem ativos.

Portas: expõe 443:443 → apenas HTTPS (não tem 80 → provavelmente força redirecionamento).

Volumes:

/home/yufonten/data/wordpress:/var/www/html → compartilha os arquivos do WordPress (o mesmo volume que o container wordpress usa).

./requirements/nginx/conf:/etc/nginx/conf.d:ro → arquivos de configuração customizados (provavelmente .conf do servidor).

Environment: reenvia SERVER_NAME para dentro do container.

Rede: participa da rede inception.

Restart policy: sempre reinicia em caso de falha.

#### Wordpress

wordpress

Build: requirements/wordpress/. → você deve ter um Dockerfile que instala PHP + WordPress CLI + configurações.

Imagem: nomeada wordpress.

Volumes: mesmo caminho do Nginx (/home/yufonten/data/wordpress:/var/www/html) → garante que Nginx lê os arquivos PHP que esse container executa.

Environment:

SERVER_NAME, WP_URL, WP_TITLE → configs do WordPress.

Conexão com o banco:

DB_HOST=${DB_HOST}

DB_NAME=${DB_NAME}

DB_USER=${DB_USER}

DB_PASSWORD_FILE=/run/secrets/wp_db_password

Admin:

WP_ADMIN_USER

WP_ADMIN_PASSWORD_FILE=/run/secrets/wp_admin_password

WP_ADMIN_EMAIL

Usuário secundário:

WP_USER2, WP_USER2_PASSWORD_FILE, WP_USER2_EMAIL, WP_USER2_ROLE

Secrets:

Senhas ficam em /run/secrets/... (bem mais seguro que variáveis de ambiente expostas).

Rede: mesma inception.

Restart: sempre reinicia.

#### Mariadb

Build: requirements/mariadb/. → seu Dockerfile deve personalizar configs e permissões do MariaDB.

Imagem: nomeada mariadb.

Volumes:

/home/yufonten/data/mariadb:/var/lib/mysql → banco de dados persistente.

Environment:

MYSQL_DATABASE=${DB_NAME}

MYSQL_USER=${DB_USER}

MYSQL_PASSWORD_FILE=/run/secrets/wp_db_password

MYSQL_ROOT_PASSWORD_FILE=/run/secrets/db_root_password

Secrets: root password e senha do usuário do WordPress ficam em ../secrets/.

Rede: inception.

Restart: sempre reinicia.

#### 🌐 Rede

inception → rede bridge interna que conecta os três serviços.

Só o nginx está exposto ao host (porta 443).

WordPress e MariaDB não estão acessíveis externamente → segurança maior.

#### 🔑 Secrets

Armazenados fora do compose, em ../secrets/...:

wp_db_password.txt

db_root_password.txt

wp_admin_password.txt

wp_user2_password.txt

Dentro do container, ficam disponíveis em /run/secrets/....

Isso evita expor senhas em variáveis de ambiente (docker inspect não mostra).

#### 🚀 Fluxo de inicialização

MariaDB inicia → cria banco e usuário (via env e secrets).

WordPress (PHP-FPM) inicia:

Conecta no MariaDB.

Usa WP-CLI para instalar e configurar o site (título, admin, usuário secundário).

Nginx inicia:

Lê configs de ./requirements/nginx/conf/.

Usa /var/www/html (compartilhado) para servir os arquivos.

Encaminha requisições PHP para o container wordpress.

O usuário acessa https://SERVER_NAME → Nginx → WordPress → MariaDB.

### Dockerfiles, entrypoints e arquivos de configuração

#### 🌐 Nginx
Dockerfile:
```
# Começa a partir de uma imagem Debian mínima, garantindo controle total do que vai ser instalado.
FROM debian:12.11

# Atualiza o sistema (apt update && apt upgrade).
# Instala nginx e openssl (openssl será usado para gerar o certificado SSL).
# Remove cache do apt para deixar a imagem mais leve.
RUN apt update && apt upgrade -y && \
    apt install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

# Cria a pasta onde serão armazenados os certificados SSL.
RUN mkdir -p /etc/nginx/certs

# Usa um argumento de build (SERVER_NAME) que você define no docker-compose.yml.
ARG SERVER_NAME=localhost

# Gera um certificado self-signed.
# Cria dois arquivos:
# /etc/nginx/certs/privkey.pem → chave privada.
# /etc/nginx/certs/fullchain.pem → certificado público.
# Esse certificado vale por 365 dias.
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/certs/privkey.pem \
    -out /etc/nginx/certs/fullchain.pem \
    -subj "/CN=${SERVER_NAME}"

# Copia o arquivo de configuração customizada (default.conf) para a pasta de configs do nginx.
COPY conf/default.conf /etc/nginx/conf.d/default.conf

# Expõe a porta 443 (HTTPS)
EXPOSE 443

# Comando que roda quando o container inicia.
# daemon off; mantém o nginx em foreground (processo principal), necessário para o Docker gerenciar o container.
CMD ["nginx", "-g", "daemon off;"]
```

Configuração do Nginx (default.conf):
```
server {
    # Servidor escuta na porta 443, com SSL e HTTP/2 ativado.
    listen 443 ssl http2;
    # O server_name recebe o valor de $SERVER_NAME (passado pelo docker-compose.yml como variável de ambiente/arg).
    server_name $SERVER_NAME;

    # Define onde estão os certificados gerados no Dockerfile.
    ssl_certificate     /etc/nginx/certs/fullchain.pem;
    ssl_certificate_key /etc/nginx/certs/privkey.pem;
    # Habilita apenas protocolos modernos (TLS 1.2 e 1.3).
    ssl_protocols TLSv1.2 TLSv1.3;

    # O document root do site fica em /var/www/html (o mesmo volume compartilhado com o WordPress).
    root /var/www/html;
    # Define a ordem de arquivos de entrada → primeiro procura index.php, depois index.html.
    index index.php index.html;

    # WordPress: envia requests inexistentes pro index.php
    location / {
        try_files $uri $uri/ /index.php?$args;
    }

    # Captura arquivos .php.
    location ~ \.php$ {
        # 
        include fastcgi_params;
        # Define o parâmetro SCRIPT_FILENAME.
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        # Passa a requisição para o PHP-FPM do container wp-php na porta 9000
        fastcgi_pass wp-php:9000;
        # Dá um timeout de 60 segundos.
        fastcgi_read_timeout 60s;
    }
}
```

### 🆆 Wordpress
Dockerfile:
```
FROM debian:12.11

# Instala:
# php-fpm → o processo que vai interpretar o PHP e responder via FastCGI (porta 9000).
# php-mysqli → extensão PHP necessária para conectar ao MariaDB.
# curl e ca-certificates → usados para baixar o wp-cli.phar.
# default-mysql-client → cliente do MySQL usado no script para checar se o banco está pronto.
RUN apt update && apt upgrade && apt install -y \
    php-fpm \
    php-mysqli \
    curl \
    ca-certificates \
    default-mysql-client

# Substitui a configuração padrão do pool www do PHP-FPM pela sua config customizada.
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
# Copia o script que vai instalar e configurar o WordPress.
COPY tools/wp-cli_script.sh .
# Dá permissão de execução.
RUN chmod +x wp-cli_script.sh

# Expõe a porta 9000, onde o PHP-FPM ficará escutando (e o nginx vai se conectar).
EXPOSE 9000

# Quando o container sobe, executa o script que instala/configura o WordPress e depois mantém o PHP-FPM rodando.
CMD ["./wp-cli_script.sh"]
```

www.conf:
```
# Os processos do PHP-FPM vão rodar com o usuário www-data (mesmo do nginx normalmente).
user = www-data
group = www-data
# Define que o PHP-FPM vai escutar na porta 9000.
# Importante: como esse é o nome do container (wp-php), o nginx consegue acessar via rede Docker (fastcgi_pass wp-php:9000;).
listen = wp-php:9000
# Gerenciamento de processos do PHP-FPM.
pm = dynamic
# Até 5 processos simultâneos.
pm.max_children = 5
# 2 processos já sobem ao iniciar.
pm.start_servers = 2
# Entre 1 e 3 processos podem ficar ociosos.
pm.min_spare_servers = 1
pm.max_spare_servers = 3
```

wp-cli_script.sh:
```
# Vai para a pasta onde os arquivos do WordPress ficam (mesmo volume montado com o nginx).
cd /var/www/html

# Faz um loop até o MariaDB aceitar conexões.
# Evita que o WordPress tente instalar antes do DB estar disponível.
while ! mysqladmin ping -h"${DB_HOST}" -u"${DB_USER}" -p"$(cat ${DB_PASSWORD_FILE})" --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done

# WP-CLI é uma ferramenta de linha de comando para gerenciar WordPress.
# Baixa e torna executável.
if [ ! -f wp-cli.phar ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
fi

# Só roda se o wp-config.php não existir (primeira vez).
# Passos:
# Baixa o core do WordPress.
# Cria o arquivo de config (wp-config.php) com dados do DB.
# Instala o WordPress: URL, título, usuário admin, senha e email.
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

# Executa o PHP-FPM em foreground (-F) → mantém o container vivo.
php-fpm8.2 -F
```

### 🦭 Mariadb
Dockerfile:
```
FROM debian:12.11

# Instala apenas o mariadb-server (sem cliente separado, pois o servidor já vem com utilitários como mysql, mysqladmin e mysql_install_db).
RUN apt update && apt upgrade && apt install -y \
    mariadb-server

# Substitui a configuração padrão pelo seu arquivo customizado (50-server.cnf).
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
# Copia o entrypoint script que vai inicializar e configurar o banco.
COPY tools/mariadb_script.sh .

# Cria o diretório que o mysqld usa para PID/socket e dá permissão de execução no script de inicialização.
RUN mkdir /run/mysqld && chmod +x mariadb_script.sh

# Expõe a porta padrão do MySQL/MariaDB (3306) para que o WordPress consiga se conectar.
EXPOSE 3306

# O container vai rodar seu script em vez de subir direto o mysqld
CMD ["./mariadb_script.sh"]
```

50-server.cnf:
```
# Faz o MariaDB aceitar conexões de qualquer IP (necessário já que o WordPress está em outro container).
bind-address = 0.0.0.0
# Define usuário, diretório de dados e temporário.
user = root
# /var/lib/mysql é onde montamos o volume persistente no docker-compose.
datadir = /var/lib/mysql
tmpdir = /tmp
# Configura UTF-8 com 4 bytes → suporte completo para emojis e caracteres especiais.
character-set-server  = utf8mb4
collation-server      = utf8mb4_general_ci
```

mariadb_script.sh:
```
# Lê as senhas de arquivos secretos (/run/secrets/...), em vez de variáveis normais → mais seguro.
DB_ROOT_PASSWORD=$(cat "$MYSQL_ROOT_PASSWORD_FILE")
DB_USER_PASSWORD=$(cat "$MYSQL_PASSWORD_FILE")

# Se a pasta /var/lib/mysql/mysql já existe, significa que o banco foi inicializado antes.
# Nesse caso, só sobe o servidor normalmente → garante persistência.
if [ -d "/var/lib/mysql/mysql" ]; then
    echo "Banco já inicializado, subindo normalmente..."
    exec mysqld_safe
fi

# Cria as tabelas internas (mysql, performance_schema, etc.).
# Isso acontece só na primeira vez que o volume está vazio.
echo "Inicializando diretório de dados..."
mysql_install_db --user=mysql --ldata=/var/lib/mysql

# Roda um servidor temporário, sem escutar em rede (--skip-networking).
# Só acessível via socket local (/tmp/mysql.sock).
# Isso evita conexões externas durante a configuração inicial.
echo "Subindo mysqld temporário..."
mysqld_safe --skip-networking --socket=/tmp/mysql.sock &
pid="$!"

# Espera o servidor inicializar
until mysqladmin ping --socket=/tmp/mysql.sock >/dev/null 2>&1; do
    sleep 1
done

# Define senha para o usuário root.
# Cria o banco definido em DB_NAME.
# Cria o usuário do WordPress e dá permissões completas nesse banco.
# O @'%' permite que esse usuário se conecte de qualquer host (essencial, já que o WordPress está em outro container).
echo "Configurando banco inicial..."
mysql --socket=/tmp/mysql.sock <<-EOSQL
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';

    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

# Encerra o servidor temporário.
mysqladmin --socket=/tmp/mysql.sock -uroot -p"${DB_ROOT_PASSWORD}" shutdown

echo "Banco configurado. Iniciando servidor principal..."
exec mysqld_safe
```

## Verificando se o os usuário foram criados corretamente

```
# Entre no container do MariaDB:
docker exec -it mariadb bash


# Conecte ao banco do WordPress:
mysql -u root -p

# Selecione o banco do WordPress (geralmente chamado wordpress ou o que você definiu):
USE wordpress;


# Liste os usuários cadastrados:
SELECT ID, user_login, user_email FROM wp_users;
```

## Gerando os certificados TSL e dando permissão

```
#Cria a pasta certs dentro do ngnix e gera os certificados lá dentro
mkdir -p srcs/requirements/nginx/certs
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout srcs/requirements/nginx/certs/privkey.pem \
  -out srcs/requirements/nginx/certs/fullchain.pem \
  -subj "/CN=yufonten.42.fr"

#Dando permissão para os arquivos
chmod 600 srcs/requirements/nginx/certs/privkey.pem
chmod 644 srcs/requirements/nginx/certs/fullchain.pem
```

## Caso seja necessário resetar a keygen-ssh (comando para windows)

Resetar keygen-ssh no windowns: ssh-keygen -R "[localhost]:4242"


