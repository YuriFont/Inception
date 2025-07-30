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
