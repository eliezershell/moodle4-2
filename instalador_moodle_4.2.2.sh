#!/bin/bash
echo "-----------------------------Instalador Automatizado do Moodle4.2.2-----------------------------"
echo "-----------------------Script by: Eliezer Ribeiro | linkedin.com/in/elinux----------------------"

echo "Atualizando pacotes do repositório APT[...]"
sudo apt update
if [ $? -gt 0 ]; then
        echo "Erro ao atualizar pacotes do repositório APT!"; exit 0
fi

echo "Instalando Apache2[...]"
sudo apt install apache2 -y
if [ $? -gt 0 ]; then
        echo "Erro ao instalar Apache2!"; exit 0
fi

echo "Instalando MySQL[...]"
sudo apt install mysql-server -y
if [ $? -gt 0 ]; then
        echo "Erro ao instalar MySQL!"; exit 0
fi

echo "Instalando PHP8.1 + Extensões[...]"
sudo apt install php8.1 libapache2-mod-php php-curl php-zip php-mysql php-xml php-mbstring php-gd php-intl php-soap -y
if [ $? -gt 0 ]; then
        echo "Erro ao instalar PHP8.1! + Extensões"; exit 0
fi

echo "------------------------------Verificando Apache2------------------------------"
systemctl status apache2
echo "-------------------------------------------------------------------------------"

echo "------------------------------Verificando MySQL------------------------------"
service mysql status
echo "-------------------------------------------------------------------------------"

echo "------------------------------Verificando PHP8.1------------------------------"
php -v
echo "-------------------------------------------------------------------------------"

echo "------------------------------Criando Database------------------------------"
read -p "Nome de usuário MySQL: " usuario
read -p "Senha de usuário MySQL: " senha
read -p "Nome do banco de dados MySQL: " banco
sudo mysql -u root <<MYSQL_SCRIPT
CREATE USER '$usuario'@'localhost' IDENTIFIED BY '$senha';
CREATE DATABASE $banco;
GRANT ALL PRIVILEGES ON $banco.* TO '$usuario'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
if [ $? -gt 0 ]; then
        echo "Erro ao criar Database!"; exit 0
fi

echo "Permitindo escrita em /var/www; /var/www/html; /etc/php/8.1/apache2/php.ini[...]"
sudo chmod a+w /var/www /var/www/html /etc/php/8.1/apache2/php.ini
if [ $? -gt 0 ]; then
        echo "Erro ao permitir escrita!"; exit 0
fi

echo "Clonando Moodle4.2 através do Github[...]"
git clone -b MOODLE_402_STABLE git://git.moodle.org/moodle.git
if [ $? -gt 0 ]; then
        echo "Erro ao clonar Moodle4.2!"; exit 0
fi

echo "Movendo arquivos do Moodle4.2 para /var/www/html[...]"
sudo mv moodle /var/www/html; sudo rm -f /var/www/html/index.html; sudo mv /var/www/html/moodle/* /var/www/html; sudo rm -rf /var/www/html/moodle
if [ $? -gt 0 ]; then
        echo "Erro ao mover arquivos!"; exit 0
fi

echo "Aumentando quantidade de variáveis em /etc/php/8.1/apache2/php.ini[...]"
sudo sed -i "s/;max_input_vars = 1000/max_input_vars = 5000/g" /etc/php/8.1/apache2/php.ini
if [ $? -gt 0 ]; then
        echo "Erro ao alterar o arquivo php.ini!"; exit 0
fi

echo "Reiniciando Apache2[...]"
sudo systemctl restart apache2

echo "------------------------------Instalação concluída com sucesso!------------------------------"
echo "----------------------Script by: Eliezer Ribeiro | linkedin.com/in/elinux--------------------"
exit 0
