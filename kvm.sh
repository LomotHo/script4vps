#!/bin/sh	

echo 'Start adding SWAP space ......';
dd if=/dev/zero of=/swapfile bs=1024 count=1024k
chown root:root /swapfile 
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile           swap                    swap    defaults        0 0" >> /etc/fstab
echo 'Add SWAP ready!';

apt update
apt install htop tmux zsh git curl -y

# ========== add user now ==========

wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh 
chmod +x bbr.sh

wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh

# # add ssh key
mkdir ~/.ssh
chmod 700 ~/.ssh
cp ./config/authorized_keys ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# *** install tmux, zsh config
git clone https://github.com/LomotHo/lomot_dotfile.git ~/.lomot_dotfile
ln -s ~/.lomot_dotfile/zsh/ohmyzsh/server.zshrc ~/.zshrc
ln -s ~/.lomot_dotfile/.tmux.conf ~/.tmux.conf
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"



