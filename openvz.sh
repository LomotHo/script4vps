#!/bin/sh	

echo 'Start adding SWAP space ......';
SWAP="${1:-512}";
NEW="$[SWAP*1024]";
TEMP="${NEW//?/ }";
OLD="${TEMP:1}0";
umount /proc/meminfo 2> /dev/null
sed "/^Swap\(Total\|Free\):/s,$OLD,$NEW," /proc/meminfo > /etc/fake_meminfo
mount --bind /etc/fake_meminfo /proc/meminfo
echo 'Add SWAP ready!';

apt update
apt install htop tmux zsh git curl -y

# ========== add user now ==========

wget https://github.com/tcp-nanqinlang/lkl-rinetd/releases/download/1.1.0/tcp_nanqinlang-rinetd-centos.sh
chmod +x tcp_nanqinlang-rinetd-debianorubuntu.sh

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

