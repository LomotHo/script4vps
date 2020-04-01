#!/bin/bash

source ./src/lib/color-log.sh

git pull
rm ~/.p10k.zsh
rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.vimrc
rm ~/.gitconfig
ln -s ~/.script4vps/config/vps.p10k.zsh ~/.p10k.zsh
ln -s ~/.script4vps/config/vps.tmux.conf ~/.tmux.conf
ln -s ~/.script4vps/config/vps.zinit.zshrc ~/.zshrc
ln -s ~/.script4vps/config/vps.vimrc ~/.vimrc
ln -s ~/.script4vps/config/vps.gitconfig ~/.gitconfig

log-info "update config OK"
