#!/bin/bash

USER_NAME=${USER_NAME:-lomot}
USER_HOME=${USER_HOME:-/home/$USER_NAME}
ZSH_HOME=${ZSH_HOME:-${USER_HOME}/.oh-my-zsh}
SCRIPT4VPS_HOME=${SCRIPT4VPS_HOME:-${USER_HOME}/.script4vps}
VPS_CONFIG_HOME=${VPS_CONFIG_HOME:-${USER_HOME}/.script4vps/config}

# add ssh key
# check if $USER_HOME/.ssh exist
if [ ! -d "${USER_HOME}/.ssh" ]; then
  log-info "no ${USER_HOME}/.ssh, mkdir ${USER_HOME}/.ssh, chmod it to 700"
  mkdir ${USER_HOME}/.ssh
  chmod 700 ${USER_HOME}/.ssh
else
  log-info "${USER_HOME}/.ssh existed, chmod it to 700"
  chmod 700 ${USER_HOME}/.ssh
fi
log-info "******copy new authorized_keys******"
cp ${VPS_CONFIG_HOME}/authorized_keys ${USER_HOME}/.ssh
chmod 600 ${USER_HOME}/.ssh/authorized_keys
