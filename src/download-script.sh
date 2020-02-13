#!/bin/bash

# download script
wget -N -nv --no-check-certificate -P $USER_HOME/ -O shadowsocks-all.sh "https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh"
wget -N -nv --no-check-certificate -P $USER_HOME/ -O linux-netspeed.sh "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
wget -N -nv --no-check-certificate -P $USER_HOME/ -O v2ray.sh "https://install.direct/go.sh"
chmod +x $USER_HOME/*.sh
git clone https://github.com/LomotHo/script4vps.git $SCRIPT4VPS_HOME
# cp -r $USER_HOME/script4vps/dotfile $DOT_FILE_HOME
