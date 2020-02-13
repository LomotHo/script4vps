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
source ./src/lib/util.sh

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
# run-script ./src/addswap/512M.sh "add swap"

# install software
run-script ./src/install-software.sh "install software"

# add user
run-script ./src/add-user.sh "add user: ${USER_NAME}"

# install install ohmyzsh
run-script ./src/install-ohmyzsh.sh "install ohmyzsh"

# install script4vps
run-script ./src/install-script4vps.sh "install script4vps"

# download script
run-script ${SCRIPT4VPS_HOME}/src/download-script.sh "download scripts"

# add ssh key
run-script ${SCRIPT4VPS_HOME}/src/add-ssh-key.sh "add ssh key"

# # install docker
# run-script ${SCRIPT4VPS_HOME}/src/install-docker.sh "install docker"

# chown home
run-script ${SCRIPT4VPS_HOME}/src/chown-home.sh "chown home"

log-warn "exec: chsh -s $(which zsh)"
