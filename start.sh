#!/bin/bash

# the new user can not be root
USER_NAME=lomot
USER_HOME=/home/$USER_NAME
ZSH_HOME=$USER_HOME/.oh-my-zsh
SCRIPT4VPS_HOME=$USER_HOME/.script4vps
VPS_CONFIG_HOME=$USER_HOME/.script4vps/config
OS=$(source /etc/os-release; echo $ID)
OS_VERSION=$(source /etc/os-release; echo $VERSION_ID)

# import lib
source ./src/lib/color-log.sh

# check OS
case $OS in
ubuntu)
    log-info "OS is ubuntu"
    ;;
debian)
    log-info "OS is debian"
    ;;
*)
    log-error "$OS OS not support"
    exit 1
    ;;
esac

# # add swap
# log-info "add swap"
# source ./src/addswap/512M.sh

# install software
log-info "install software"
source ./src/install-software.sh

# add user
log-info "add user: ${USER_NAME}"
source ./src/add-user.sh

# install script4vps
log-info "install script4vps"
source ./src/install-script4vps.sh


# download script
log-info "download scripts"
source ${SCRIPT4VPS_HOME}/src/download-script.sh

# add ssh key
log-info "add ssh key"
source ${SCRIPT4VPS_HOME}/src/add-ssh-key.sh

# # install docker
# log-info "install docker"
# source ./src/install-docker.sh

# chown home
log-info "chown home"
source ${SCRIPT4VPS_HOME}/src/chown-home.sh

log-warning "exec: chsh -s $(which zsh)"


