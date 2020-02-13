#!/bin/bash

# download script
wget -N --no-check-certificate -O shadowsocks-all.sh "https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh"
wget -N --no-check-certificate -O linux-netspeed.sh "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
wget -N --no-check-certificate -O v2ray.sh "https://install.direct/go.sh"
chmod +x $USER_HOME/*.sh
git clone https://github.com/LomotHo/script4vps.git $SCRIPT4VPS_HOME
# cp -r $USER_HOME/script4vps/dotfile $DOT_FILE_HOME
