#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo -e "\e[31m ERROR: This script must be run as root \e[39m" 1>&2
   exit 1
fi


# Install Google Chrome 
echo -e "\e[32m Installing Google Chrome Stable \e[39m"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install -y google-chrome-stable
echo -e "\e[32mInstallation Completed \e[39m"


# Install VLC player
echo -e "\e[32mInstalling VLC PLayer \e[39m"
sudo apt-get install -y vlc browser-plugin-vlc
echo -e "\e[32mInstallation completed \e[39m"

# Install SUBLIME TEXT 3
echo -e "\e[32mInstalling Sublime Text3\e[39m"
sudo apt-add-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install -y sublime-text-installer
echo -e "\e[32mInstallation completed \e[39m"

# Install VIM
echo -e "\e[32mInstalling VIM EDITOR \e[39m"
sudo apt-get install -y vim
echo -e "\e[32mInstallation completed \e[39m"


# Install git
echo -e "\e[32mInstalling GIT \e[39m"
sudo apt-get install -y git
echo -e "\e[32mInstallation completed \e[39m"

