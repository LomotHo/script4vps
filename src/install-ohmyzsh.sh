#!/bin/bash

USER_NAME=${USER_NAME:-lomot}
USER_HOME=${USER_HOME:-/home/$USER_NAME}
ZSH_HOME=${ZSH_HOME:-${USER_HOME}/.oh-my-zsh}
SCRIPT4VPS_HOME=${SCRIPT4VPS_HOME:-${USER_HOME}/.script4vps}
VPS_CONFIG_HOME=${VPS_CONFIG_HOME:-${USER_HOME}/.script4vps/config}


## install zsh
ZSH=$ZSH_HOME
REPO=${REPO:-ohmyzsh/ohmyzsh}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}

git clone -c core.eol=lf -c core.autocrlf=false \
  -c fsck.zeroPaddedFilemode=ignore \
  -c fetch.fsck.zeroPaddedFilemode=ignore \
  -c receive.fsck.zeroPaddedFilemode=ignore \
  --depth=1 --branch "$BRANCH" "$REMOTE" "$ZSH" || {
  error "git clone of oh-my-zsh repo failed"
  exit 1
}
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ZSH_HOME/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$ZSH_HOME/custom}/plugins/zsh-autosuggestions
