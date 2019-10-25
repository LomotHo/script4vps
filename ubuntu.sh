#!/bin/sh

# the new user can not be root
USER_NAME=lomot
USER_HOME=/home/$USER_NAME
ZSH_HOME=$USER_HOME/.oh-my-zsh
SCRIPT4VPS_HOME=$USER_HOME/.script4vps
VPS_CONFIG_HOME=$USER_HOME/.script4vps/config


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
apt install htop vim net-tools tmux zsh git curl -y


# add user
echo 'Add new user $USER_NAME';
adduser $USER_NAME
usermod -aG sudo $USER_NAME
cd $USER_HOME


# download script
wget -N --no-check-certificate -O shadowsocks-all.sh "https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh"
wget -N --no-check-certificate -O linux-netspeed.sh "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
wget -N --no-check-certificate -O v2ray.sh "https://install.direct/go.sh"
chmod +x $USER_HOME/*.sh
git clone https://github.com/LomotHo/script4vps.git $SCRIPT4VPS_HOME
# cp -r $USER_HOME/script4vps/dotfile $DOT_FILE_HOME


# add ssh key
# check if $USER_HOME/.ssh exist
if [ ! -d "$USER_HOME/.ssh" ]; then
  echo "no $USER_HOME/.ssh, mkdir $USER_HOME/.ssh, chmod it to 700"
  mkdir $USER_HOME/.ssh
  chmod 700 $USER_HOME/.ssh
else
  echo "$USER_HOME/.ssh existed, chmod it to 700"
  chmod 700 $USER_HOME/.ssh
fi
echo "******copy new authorized_keys******"
cp $VPS_CONFIG_HOME/authorized_keys $USER_HOME/.ssh
chmod 600 $USER_HOME/.ssh/authorized_keys


# install tmux, zsh config
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH_HOME"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ZSH_HOME/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$ZSH_HOME/custom}/plugins/zsh-autosuggestions
ln -s $VPS_CONFIG_HOME/vps.zshrc $USER_HOME/.zshrc
ln -s $VPS_CONFIG_HOME/vps.tmux.conf $USER_HOME/.tmux.conf


# chown
chown -R $USER_NAME:$USER_NAME $USER_HOME/*
chown -R $USER_NAME:$USER_NAME $USER_HOME/.*
echo "exec: chsh -s $(which zsh)"
