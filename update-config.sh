#!/bin/sh

git pull
rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.vimrc
ln -s ~/.script4vps/config/vps.tmux.conf ~/.tmux.conf
ln -s ~/.script4vps/config/vps.zshrc ~/.zshrc
ln -s ~/.script4vps/config/vps.vimrc ~/.vimrc
