#!/bin/bash

echo "Hi $USER"

# add repos and keys
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
#sudo add-apt-repository -y ppa:webupd8team/java
#sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

# basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# install apps
sudo apt -y install \
    sublime-text git \
    git-flow  snap \
    oracle-java7-installer \
    oracle-java7-set-default curl \
    nodejs-legacy ruby-full \
    apache2 mysql-server mysql_secure_installation \
    php libapache2-mod-php php-mysql php-cli phpmyadmin python3-pip 

sudo snap  install skype --classic
sudo snap  install mailspring --classic

#allow incoming HTTP and HTTPS traffic for this profile:
sudo ufw allow in "Apache Full"

# gems installs
sudo gem install compass

# phpmyadmin fix
echo -e "\n Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf

# restart apache2
sudo /etc/init.d/apache2 restart

# Unistall buggy package PHP
#sudo apt-get remove php7.0-snmp

# install Composer
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# install virtualhost script
#sudo chmod +x virtualhost.sh
#sudo mv virtualhost.sh /usr/local/bin/

# make virtual host 
#read -p "Please enter your Virtualhost name (example.dev)  : " name
#echo ""
#sudo virtualhost create $name

# remove and folders
#sudo rm -rf ~/Public
#sudo rm -rf ~/Templates
#sudo rm -rf /var/www/html
sudo rm ~/examples.desktop


# prompt for a reboot
clear
echo ""
echo "#==============================================================#"
echo "#                      TIME FOR A REBOOT!                      #"
echo "#==============================================================#"
echo ""
echo ""
echo -e $"do you want to Rebooot system ? (y/n)"
read question

if [ "$question" == 'y' -o "$question" == 'Y' ]; then
	### reboot
	reboot
else
	echo  "### _H A V E_ _A_  _N I C E_  _D A Y_ ###"
fi
