#!/bin/bash

# the new user can not be root
USER_NAME=lomot
USER_HOME=/home/$USER_NAME
OMZ_HOME=$USER_HOME/.oh-my-zsh
SCRIPT4VPS_HOME=$USER_HOME/.script4vps
VPS_CONFIG_HOME=$USER_HOME/.script4vps/config
OS=$(source /etc/os-release; echo $ID)
OS_VERSION=$(source /etc/os-release; echo $VERSION_ID)
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

# # install install ohmyzsh
# case ${1} in
# "-cn")
#     run-script ./src/install-omz-cn.sh "install ohmyzsh"
#     ;;
# *)
#     run-script ./src/install-omz.sh "install ohmyzsh"
#     ;;
# esac

# install install zinit
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

# # install docker
# run-script ${SCRIPT4VPS_HOME}/src/install-docker.sh "install docker"
# run-script ${SCRIPT4VPS_HOME}/src/install-docker-cn.sh "install docker"

# chown home
run-script ${SCRIPT4VPS_HOME}/src/chown-home.sh "chown home"

log-warn "exec: chsh -s $(which zsh)"


