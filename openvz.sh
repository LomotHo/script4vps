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
apt install htop tmux zsh git curl

# add user now 

wget https://raw.githubusercontent.com/kuoruan/shell-scripts/master/ovz-bbr/ovz-bbr-installer.sh
chmod +x ovz-bbr-installer.sh

wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh

# # add ssh key
# # 检查是否存在 ~/.ssh
# if [ ! -d "$HOME/.ssh" ]; then
#   echo "no $HOME/.ssh, mkdir ~/.ssh, chmod it to 700"
#   mkdir ~/.ssh
#   chmod 700 ~/.ssh
# else 
#   echo "$HOME/.ssh existed, chmod it to 700"
#   chmod 700 ~/.ssh
# fi
# # 检查是否存在 ~/.ssh/authorized_keys
# if [ -f "$HOME/.ssh/authorized_keys" ]; then
#   echo "$HOME/.ssh/authorized_keys existed, move it to authorized_keys.orign"
#   mv ~/.ssh/authorized_keys ~/.ssh/authorized_keys.orign
# fi
# # 复制~/.ssh/authorized_keys
# echo "copy new authorized_keys"
# cp ./config/authorized_keys ~/.ssh
# chmod 600 ~/.ssh/authorized_keys

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

