#!/bin/bash

# Definir usuário e grupo
USER="yufonten"
GROUP="yufonten"

# Criar diretórios e arquivos
mkdir -p ./srcs/requirements/{bonus,mariadb/conf,mariadb/tools,nginx/conf,nginx/tools,tools,wordpress}

# Criar arquivos na raiz
touch ./Makefile

# Criar arquivos em ./srcs
touch ./srcs/docker-compose.yml ./srcs/.env

# Criar arquivos em ./srcs/requirements/mariadb
touch ./srcs/requirements/mariadb/Dockerfile ./srcs/requirements/mariadb/.dockerignore

# Criar arquivos em ./srcs/requirements/nginx
touch ./srcs/requirements/nginx/Dockerfile ./srcs/requirements/nginx/.dockerignore

# Definir permissões e dono para diretórios
find . -type d -exec chmod 775 {} \;
find . -type d -exec chown $USER:$GROUP {} \;

# Definir permissões e dono para arquivos
find . -type f -exec chmod 664 {} \;
find . -type f -exec chown $USER:$GROUP {} \;

# Ajustar permissões do diretório pai (../) para drwxrwxrwt
chmod 1777 ..

# Exibir a estrutura criada
ls -lR .
