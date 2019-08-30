#!/bin/sh

USER_NAME=lomot
USER_HOME=/home/$USER_NAME
ZSH_HOME=$USER_HOME/.oh-my-zsh
SCRIPT4VPS_HOME=$USER_HOME/.script4vps
VPS_CONFIG_HOME=$USER_HOME/.script4vps/config

git clone https://github.com/LomotHo/script4vps.git $SCRIPT4VPS_HOME

rm -rf $USER_HOME/.lomot_dotfile
rm $USER_HOME/.tmux.conf
rm $USER_HOME/.zshrc
ln -s $VPS_CONFIG_HOME/vps.tmux.conf $USER_HOME/.tmux.conf
ln -s $VPS_CONFIG_HOME/vps.zshrc $USER_HOME/.zshrc
