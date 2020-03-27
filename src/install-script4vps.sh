#!/bin/bash

USER_NAME=${USER_NAME:-lomot}
USER_HOME=${USER_HOME:-/home/$USER_NAME}
OMZ_HOME=${OMZ_HOME:-${USER_HOME}/.oh-my-zsh}
SCRIPT4VPS_HOME=${SCRIPT4VPS_HOME:-${USER_HOME}/.script4vps}
VPS_CONFIG_HOME=${VPS_CONFIG_HOME:-${USER_HOME}/.script4vps/config}

## download script4vps
git clone https://github.com/LomotHo/script4vps.git ${SCRIPT4VPS_HOME}

## install tmux, zsh config
log-info "install config"
ln -s ${VPS_CONFIG_HOME}/vps.p10k.zsh ${USER_HOME}/.p10k.zsh
ln -s ${VPS_CONFIG_HOME}/vps.tmux.conf ${USER_HOME}/.tmux.conf
ln -s ${VPS_CONFIG_HOME}/vps.vimrc ${USER_HOME}/.vimrc
ln -s ${VPS_CONFIG_HOME}/vps.gitconfig ${USER_HOME}/.gitconfig

echo "DefaultTimeoutStartSec=3s" >> /etc/systemd/system.conf
echo "DefaultTimeoutStopSec=3s" >> /etc/systemd/system.conf
systemctl daemon-reload