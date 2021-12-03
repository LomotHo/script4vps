#!/bin/bash

USER_HOME=/root
ZINIT_HOME=${ZINIT_HOME:-${USER_HOME}/.zinit}
SCRIPT4VPS_HOME=$USER_HOME/.script4vps
VPS_CONFIG_HOME=$USER_HOME/.script4vps/config
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
apt install htop vim tmux zsh git curl -y


# download script
wget -N --no-check-certificate -O shadowsocks-all.sh "https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh"
wget -N --no-check-certificate -O linux-netspeed.sh "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
wget -N --no-check-certificate -O v2ray.sh "https://install.direct/go.sh"
chmod +x $USER_HOME/*.sh
git clone https://git.lomot.top/lomot/script4vps.git $SCRIPT4VPS_HOME
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
# git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$OMZ_HOME"
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$OMZ_HOME/custom}/plugins/zsh-syntax-highlighting
# # git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$OMZ_HOME/custom}/plugins/zsh-autosuggestions
# ln -s $VPS_CONFIG_HOME/vps.omz.zshrc $USER_HOME/.zshrc
mkdir ${ZINIT_HOME}
git clone https://github.com/zdharma-continuum/zinit.git ${ZINIT_HOME}/bin
ln -s ${VPS_CONFIG_HOME}/vps.zinit.zshrc ${USER_HOME}/.zshrc
ln -s ${VPS_CONFIG_HOME}/vps.p10k.zsh ${USER_HOME}/.p10k.zsh
ln -s $VPS_CONFIG_HOME/vps.tmux.conf $USER_HOME/.tmux.conf
ln -s $VPS_CONFIG_HOME/vps.vimrc $USER_HOME/.vimrc
ln -s $VPS_CONFIG_HOME/vps.gitconfig $USER_HOME/.gitconfig


chsh -s $(which zsh)
zsh
