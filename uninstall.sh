#!/bin/bash

source ./src/lib/color-log.sh

log-info "uninstall script4vps"

rm ~/.p10k.zsh
rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.vimrc
rm ~/.gitconfig
rm -rf ~/.zinit
rm -rf ~/.oh-my-zsh
rm -rf ~/.script4vps

log-info "uninstall OK"
