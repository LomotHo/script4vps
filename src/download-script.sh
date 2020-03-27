#!/bin/bash
#!/bin/bash

USER_NAME=${USER_NAME:-lomot}
USER_HOME=${USER_HOME:-/home/$USER_NAME}

# download script
# wget -nv --no-check-certificate -O $USER_HOME/shadowsocks-all.sh "https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh"
wget -nv --no-check-certificate -O $USER_HOME/linux-netspeed.sh "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
wget -nv --no-check-certificate -O $USER_HOME/v2ray.sh "https://install.direct/go.sh"
chmod +x $USER_HOME/*.sh
