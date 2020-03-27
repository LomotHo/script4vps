#!/bin/bash

USER_NAME=${USER_NAME:-lomot}
USER_HOME=${USER_HOME:-/home/$USER_NAME}
ZSH_HOME=${ZSH_HOME:-${USER_HOME}/.oh-my-zsh}
SCRIPT4VPS_HOME=${SCRIPT4VPS_HOME:-${USER_HOME}/.script4vps}
VPS_CONFIG_HOME=${VPS_CONFIG_HOME:-${USER_HOME}/.script4vps/config}


## install zsh
ZSH=$ZSH_HOME
REPO=${REPO:-lomot/ohmyzsh}
REMOTE=${REMOTE:-https://gitee.com/${REPO}.git}

git clone --depth=1 $REMOTE $ZSH_HOME
git clone https://gitee.com/lomot/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ZSH_HOME/custom}/plugins/zsh-syntax-highlighting
# git clone https://gitee.com/lomot/zsh-autosuggestions.git ${ZSH_CUSTOM:-$ZSH_HOME/custom}/plugins/zsh-autosuggestions
