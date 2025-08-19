# Inception

https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/

Fazer login a primeira vez com root

Começar setup com comando "setup-alpine"

system hostname = username.42.fr

proxy = none

criar usuário = username

disk session -
sda,
sys,
y

Retirar a iso antes de usar comando reboot</br>
<img width="586" height="344" alt="image" src="https://github.com/user-attachments/assets/d925313a-c8ca-4e97-9a23-22838a098558" />


Instalando o sudo</br>
Primeiro descomentar a linha alpine.mirror.wearetriple. om/v3/18/community em vi /etc/apk/repositories. Assim permitindo puxar pacotes de outros repositório.

Depois usar esses comandos:
su -
apk update
apk add sudo
sudo visudo

Descomente essa linha.</br><img width="528" height="313" alt="image" src="https://github.com/user-attachments/assets/b48da186-9239-495c-8e85-233c31979e45" />
Agora adicione o seu usuário ao rupo do sudo:
addgroup sudo
adduser yufonten sudo


Instalando o SSH

sudo apk update
sudo apk add vim
sudo vim /etc/ssh/sshd_config

Depois de abrir o arquivo descomente a porta e altere para uma da sua escolha ex: 4242</br><img width="517" height="337" alt="image" src="https://github.com/user-attachments/assets/bfdaa23a-1a20-4b7b-a4c9-91fd14c4e1fc" />

Agora vamos acessar a sudo vi /etc/ssh/ssh_config/ e também descomentar a porta</br><img width="521" height="397" alt="image" src="https://github.com/user-attachments/assets/3094628c-f757-4a3f-a6e3-63eaa046cea2" />

reinicie o serviço: sudo rc-service sshd restart

e check para ver se está funcionando: netstat -tuln | grep 4242

Agora vamos adicionar a porta na VM</br><img width="507" height="336" alt="image" src="https://github.com/user-attachments/assets/f6045a51-6acd-457d-8848-1c7fafc40e79" />
<img width="586" height="381" alt="image" src="https://github.com/user-attachments/assets/8435638a-b09f-4e0c-b05e-62c96afe4164" />
Agora é só conectar usando ssh yufonten@localhost -p 4242

Instalando os pacotes gráficos do alpine

sudo apk add xorg-server xfce4 xfce4-terminal lightdm lightdm-gtk-greeter xf86-input-libinput elogind

setup-devd udev
rc-update add elogind
rc-update add lightdm
reboot

Instalando e configurando o Docker:</br>
sudo apk update
 sudo apk add docker docker-compose
 sudo apk add --update docker openrc
 sudo rc-update add docker boot
 sudo service docker start</br>

 Adicionar o seu usuário ao grupo docker para rodas os comandos sem o sudo:  sudo adduser <username> docker

Instalação do comand line do Docker Compose:  sudo apk add docker-cli-compose

Criando os arquivos necessários

Para redefinir os donos de diretórios e arquivos = chown yufonten:yufonten <directory>

Tipos de permissões que vamos encontrar:

chmod 775
chmod 1777
chmo 664
chmo 644

Dockerfile - MariaDB</br>
<img width="677" height="607" alt="image" src="https://github.com/user-attachments/assets/8ce438ff-fd94-478f-bfd6-7357611b24ac" /></br>

Caso seja necessário atualizar o kernel

# Instale o kernel linux-lts
sudo apk add linux-lts

# Atualize o GRUB (ou equivalente no Alpine) para usar o novo kernel
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Reinicie o sistema para carregar o novo kernel
sudo reboot

# Tentando com Debian

Link para última versão estável do Debian: https://cdimage.debian.org/cdimage/archive/12.7.0/amd64/iso-dvd/

Resetar keygen-ssh no windowns: ssh-keygen -R "[localhost]:4242"

## Instalando docker e docker compose v2

sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
docker --version
docker compose version




