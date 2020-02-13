#!/bin/sh

# the new user can not be root
USER_NAME=lomot
USER_HOME=/home/$USER_NAME
ZSH_HOME=$USER_HOME/.oh-my-zsh
SCRIPT4VPS_HOME=$USER_HOME/.script4vps
VPS_CONFIG_HOME=$USER_HOME/.script4vps/config
OS=$(source /etc/os-release; echo $ID)
OS_VERSION=$(source /etc/os-release; echo $VERSION_ID)

# check OS
case $OS in
ubuntu)
    echo "OS is ubuntu"
    ;;
debian)
    echo "OS is debian"
    ;;
*)
    echo "OS not support"
    exit 1
    ;;
esac

# add swap
# source ./src/addswap/512M.sh

# install software
source ./src/install-software.sh

# add user
source ./src/add-user.sh

# download script
source ./src/download-script.sh

# add ssh key
source ./src/add-ssh-key.sh

# install tmux, zsh config
source ./src/install-config.sh

# install docker
USER=$USER_NAME
case $OS in
ubuntu)
    source ./src/docker/ubuntu.sh
    ;;
debian)
    source ./src/docker/debian.sh
    ;;
esac

# chown home
chown -R $USER_NAME:$USER_NAME $USER_HOME/*
chown -R $USER_NAME:$USER_NAME $USER_HOME/.*

echo "exec: chsh -s $(which zsh)"


