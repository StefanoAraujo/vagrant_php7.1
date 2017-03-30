Vagrant-Setup
===========
Configuração do Vagrant com provisionamento em Shell Script para criar uma máquina virtual, Ubuntu Server 14.04 64 Bits

###Pacotes Inclusos: setup.sh

- PHP 5.6
- MySQL 5.5
- Git
- PhpMyAdmin 
- Composer
- cURL
- Vim
- Redis

Requisitos: 
==============

- Virtualbox - https://www.virtualbox.org/
- Vagrant - http://www.vagrantup.com/
- Git - http://git-scm.com ( Opicional )
- Acesso Internet

Instalação
===========
* Clonar repositório para sua máquina:

* Prompt de comando/Terminal Entre no diretório da clonagem.
* Inicie a máquina virtual com o comando:
- vagrant up 

Configuração 
http://localhost:8080, 
http://localhost:8080/phpmyadmin, 

Senha Mysql
- Login: root
- Senha: vagrant

Senha para serviços
- Senha: vagrant

Conteudo Sicronizado
- diretório "www" , estará disponível via http://localhost:8080.
- Existe index.php Chamando função phpinfo().

Para desligar a máquina virtual utilize o comando:
- vagrant halt

Para religar novamente utilize:
- vagrant up

Caso queira destruir a máquina virtual, não Exclui conteúdo do www:
- vagrant destroy
