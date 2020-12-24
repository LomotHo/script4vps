#!/bin/bash

# the new user can not be root
USER_NAME=${USER_NAME:-lomot}
USER_HOME=${USER_HOME:-/home/$USER_NAME}
ZINIT_HOME=${ZINIT_HOME:-${USER_HOME}/.zinit}
SCRIPT4VPS_HOME=${SCRIPT4VPS_HOME:-${USER_HOME}/.script4vps}
VPS_CONFIG_HOME=${VPS_CONFIG_HOME:-${USER_HOME}/.script4vps/config}

OS=$(
    source /etc/os-release
    echo $ID
)
OS_VERSION=$(
    source /etc/os-release
    echo $VERSION_ID
)
SOURCE_LIST_HOME=${SOURCE_LIST_HOME:-./src/china-source}

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

# check if $USER is root
case $USER in
root) ;;

*)
    log-error "This script must be run as root!"
    exit 1
    ;;
esac

# # add swap
# run-script ./src/addswap/512M.sh "add swap"

# check if China
case ${1} in
"-cn")
    # install china source
    log-info "chinese vps"
    run-script ./src/install-source.sh "install china source"
    ;;
*)
    log-info "not chinese vps"
    ;;
esac

# install software
run-script ./src/install-software.sh "install software"

# add user
run-script ./src/add-user.sh "add user: ${USER_NAME}"

# install zinit
case ${1} in
"-cn")
    run-script ./src/install-zinit-cn.sh "install zinit"
    ;;
*)
    run-script ./src/install-zinit.sh "install zinit"
    ;;
esac

# install script4vps
run-script ./src/install-script4vps.sh "install script4vps"

# download script
run-script ${SCRIPT4VPS_HOME}/src/download-script.sh "download scripts"

# add ssh key
run-script ${SCRIPT4VPS_HOME}/src/add-ssh-key.sh "add ssh key"

# install docker
run-script ${SCRIPT4VPS_HOME}/src/install-docker.sh "install docker"

# # chown home
# run-script ${SCRIPT4VPS_HOME}/src/chown-home.sh "chown home"

# final work
log-info "chown home"
chown -R $USER_NAME:$USER_NAME $USER_HOME/*
chown -R $USER_NAME:$USER_NAME $USER_HOME/.*
log-info "chsh"
sudo -u ${USER_NAME} chsh -s $(which zsh)
log-info "newgrp docker"
sudo -u ${USER_NAME} newgrp docker

# log-warn "exec: chsh -s $(which zsh)"
# log-warn "exec: newgrp docker"
