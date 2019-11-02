#!/bin/sh

git clone https://github.com/LomotHo/script4vps.git ~/.script4vps
rm -rf ~/.lomot_dotfile
rm ~/.tmux.conf
rm ~/.zshrc
ln -s ~/.script4vps/config/vps.tmux.conf ~/.tmux.conf
ln -s ~/.script4vps/config/vps.zshrc ~/.zshrc
ln -s ~/.script4vps/config/vps.vimrc ~/.vimrc
