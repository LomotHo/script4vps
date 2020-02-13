#!/bin/bash

git pull
rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.vimrc
rm ~/.gitconfig
ln -s ~/.script4vps/config/vps.tmux.conf ~/.tmux.conf
ln -s ~/.script4vps/config/vps.zshrc ~/.zshrc
ln -s ~/.script4vps/config/vps.vimrc ~/.vimrc
ln -s ~/.script4vps/config/vps.gitconfig ~/.gitconfig
echo "[ok] update config"