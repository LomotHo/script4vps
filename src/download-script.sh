#!/bin/bash

# download script
wget -nv --no-check-certificate -P $USER_HOME -O shadowsocks-all.sh "https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh"
wget -nv --no-check-certificate -P $USER_HOME -O linux-netspeed.sh "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
wget -nv --no-check-certificate -P $USER_HOME -O v2ray.sh "https://install.direct/go.sh"
chmod +x $USER_HOME/*.sh
