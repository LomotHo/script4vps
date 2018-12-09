#!/bin/sh	

USER_HOME=/root
ZSH=$USER_HOME/.oh-my-zsh
cd $USER_HOME

# add swap
echo 'Start adding SWAP space ......';
dd if=/dev/zero of=/swapfile bs=1024 count=1024k
chown root:root /swapfile 
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile           swap                    swap    defaults        0 0" >> /etc/fstab
echo 'Add SWAP ready!';

# install software
apt update
apt install htop tmux zsh git curl -y

# download script
wget --no-check-certificate -O bbr.sh https://github.com/teddysun/across/raw/master/bbr.sh 
# wget --no-check-certificate -O ohmyzsh.sh https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x $USER_HOME/*.sh

# install tmux, zsh config
git clone https://github.com/LomotHo/lomot_dotfile.git $USER_HOME/.lomot_dotfile
ln -s $USER_HOME/.lomot_dotfile/zsh/ohmyzsh/server.zshrc $USER_HOME/.zshrc
ln -s $USER_HOME/.lomot_dotfile/.tmux.conf $USER_HOME/.tmux.conf

# add ssh key
# 检查是否存在 $USER_HOME/.ssh
if [ ! -d "$USER_HOME/.ssh" ]; then
  echo "no $USER_HOME/.ssh, mkdir $USER_HOME/.ssh, chmod it to 700"
  mkdir $USER_HOME/.ssh
  chmod 700 $USER_HOME/.ssh
else 
  echo "$USER_HOME/.ssh existed, chmod it to 700"
  chmod 700 $USER_HOME/.ssh
fi
# 复制$USER_HOME/.ssh/authorized_keys
echo "******copy new authorized_keys******"
git clone https://github.com/LomotHo/script4vps.git
cp $USER_HOME/script4vps/config/authorized_keys $USER_HOME/.ssh
chmod 600 $USER_HOME/.ssh/authorized_keys

# install zsh
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH"
echo "run bbr.sh & shadowsocks-all.sh"
chsh -s $(which zsh)
zsh
