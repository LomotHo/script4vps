#!/bin/bash

USER_NAME=${USER_NAME:-lomot}
USER_HOME=${USER_HOME:-/home/$USER_NAME}
OMZ_HOME=${OMZ_HOME:-${USER_HOME}/.oh-my-zsh}
ZINIT_HOME=${OMZ_HOME:-${USER_HOME}/.oh-my-zsh}
SCRIPT4VPS_HOME=${SCRIPT4VPS_HOME:-${USER_HOME}/.script4vps}
VPS_CONFIG_HOME=${VPS_CONFIG_HOME:-${USER_HOME}/.script4vps/config}


## install zinit
mkdir ${ZINIT_HOME}
git clone https://gitee.com/lomot/zinit.git ${ZINIT_HOME}/bin
ln -s ${VPS_CONFIG_HOME}/vps.zinit.zshrc ${USER_HOME}/.zshrc
