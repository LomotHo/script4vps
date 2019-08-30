#!/bin/sh

USER_HOME=/root
ZSH_HOME=$USER_HOME/.oh-my-zsh
DOT_FILE_HOME=$USER_HOME/.vps_dotfile
cd $USER_HOME


# add swap
echo 'Start adding SWAP space ......';
SWAP="${1:-512}";
NEW="$[SWAP*1024]";
TEMP="${NEW//?/ }";
OLD="${TEMP:1}0";
umount /proc/meminfo 2> /dev/null
sed "/^Swap\(Total\|Free\):/s,$OLD,$NEW," /proc/meminfo > /etc/fake_meminfo
mount --bind /etc/fake_meminfo /proc/meminfo
echo 'Add SWAP ready!';


# install software
apt update
apt install htop vim tmux zsh git curl -y


# download script
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x $USER_HOME/*.sh
git clone https://github.com/cx9208/Linux-NetSpeed.git $USER_HOME
git clone https://github.com/LomotHo/script4vps.git $USER_HOME
cp -r $USER_HOME/script4vps/dotfile $DOT_FILE_HOME


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
cp $USER_HOME/script4vps/config/authorized_keys $USER_HOME/.ssh
chmod 600 $USER_HOME/.ssh/authorized_keys


# install tmux, zsh config
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH_HOME"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ZSH_HOME/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$ZSH_HOME/custom}/plugins/zsh-autosuggestions
ln -s $DOT_FILE_HOME/vps.zshrc $USER_HOME/.zshrc
ln -s $DOT_FILE_HOME/vps.tmux.conf $USER_HOME/.tmux.conf
chsh -s $(which zsh)
zsh
