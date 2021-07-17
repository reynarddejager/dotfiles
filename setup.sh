#!/bin/bash

# A script to quickly setup and configure a Ubuntu 21.04 minimal install

printf "===============\n"
printf "System\n"
printf "===============\n"
sudo apt update
sudo apt upgrade -y

printf "\n"
printf "===============\n"
printf "Folders\n"
printf "===============\n"

printf "Clearing folders...\n"
rm -df $HOME/Documents
rm -df $HOME/Music
rm -df $HOME/Pictures
rm -df $HOME/Public
rm -df $HOME/Templates
rm -df $HOME/Videos

printf "Creating folders...\n"
mkdir -p $HOME/projects
mkdir -p $HOME/apps

printf "\n"
printf "===============\n"
printf "Apps\n"
printf "===============\n"

printf "Removing apps...\n"
sudo apt remove -y firefox
rm -rf $HOME/.mozilla

printf "\n"
printf "Installing apps...\n"
sudo apt install -y \
	htop \
	neofetch \
	vim \
	curl \
	terminator \
	dconf-editor \
	apt-transport-https \
	ca-certificates \
	gnupg \
	lsb-release

# Terminator
mkdir -p $HOME/.config/terminator
cp terminator_config $HOME/.config/terminator/config

printf "\n"
printf "Installing snaps...\n"
sudo snap install code --classic
sudo snap install libreoffice
sudo snap install spotify

sudo snap install discord
sudo snap connect discord:system-observe

# Chrome
printf "\n"
printf "Installing Chrome...\n"
if [ ! -x /usr/bin/google-chrome ]
then
 wget -nv https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O $HOME/apps/google-chrome-stable_current_amd64.deb
 sudo dpkg -i $HOME/apps/google-chrome-stable_current_amd64.deb
fi

# Processing
printf "\n"
printf "Installing Processing v3.5.4...\n"
if [ ! -d "$HOME/apps/processing-3.5.4" ]
then
 wget -nv "https://github.com/processing/processing/releases/download/processing-0270-3.5.4/processing-3.5.4-linux64.tgz" -O $HOME/apps/processing-3.5.4-linux64.tgz
 tar -zxf $HOME/apps/processing-3.5.4-linux64.tgz -C $HOME/apps

 mkdir -p $HOME/.processing
 cp processing_preferences $HOME/.processing/preferences.txt
 
 mkdir -p $HOME/projects/sketchbook
 sudo bash $HOME/apps/processing-3.5.4/install.sh
fi

# Postman
printf "\n"
printf "Installing Postman\n"
if [ ! -d "$HOME/apps/Postman" ]
then
 wget -nv "https://dl.pstmn.io/download/latest/linux" -O $HOME/apps/postman-latest.tar.gz
 tar -zxf $HOME/apps/postman-latest.tar.gz -C $HOME/apps
fi

# NVM
printf "\n"
printf "Installing NVM\n"
if [ ! -d "$HOME/.nvm" ]
then
 wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
fi

# NodeJS LTS
source $HOME/.nvm/nvm.sh
nvm install --lts

# Docker
printf "\n"
printf "Installing Docker\n"
if [ ! -e "/usr/bin/docker" ]
then
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

 echo \
   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

 sudo apt update
 sudo apt install -y \
	docker-ce \
	docker-ce-cli \
	containerd.io
fi

# Docker Compose
printf "\n"
printf "Installing Docker Compose\n"
if [ ! -e "/usr/local/bin/docker-compose" ]
then
 sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 sudo chmod +x /usr/local/bin/docker-compose
fi

# GTK: Default bookmarks
rm $HOME/.config/gtk-3.0/bookmarks
echo "file://${HOME}/Downloads" >> $HOME/.config/gtk-3.0/bookmarks
echo "file://${HOME}/apps" >> $HOME/.config/gtk-3.0/bookmarks
echo "file://${HOME}/projects" >> $HOME/.config/gtk-3.0/bookmarks

# Nautilus: Hide folders
echo snap > $HOME/.hidden

# GNOME Shell
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'code_code.desktop', 'terminator.desktop']"

gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "RIGHT"

gsettings set org.gnome.shell.extensions.ding show-home false
gsettings set org.gnome.shell.extensions.ding show-network-volumes false
gsettings set org.gnome.shell.extensions.ding show-trash false
gsettings set org.gnome.shell.extensions.ding show-volumes false

# GNOME Desktop
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-dark"

# TODO: Clone the repo & create a scheduled script to change wallpapers
mkdir -p $HOME/.local/share/backgrounds
wget -nv https://gitlab.com/dwt1/wallpapers/-/raw/master/0042.jpg -O $HOME/.local/share/backgrounds/northern-lights.jpg
gsettings set org.gnome.desktop.background picture-uri "${HOME}/.local/share/backgrounds/northern-lights.jpg"

# GIT
git config --global user.email "reynarddejager@gmail.com"
git config --global user.name "Reynard de Jager"

printf "\n"
printf "===============\n"
printf "Done!\n"
printf "===============\n"
