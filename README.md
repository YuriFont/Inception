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


