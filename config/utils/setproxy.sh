#!/bin/bash
echo -e "\033[32m[help] \033[0m"run source setproxy.sh

proxy_server_host=localhost
if [ "$1" != '' ]; then
   proxy_server_host=$1
  #  echo proxy_server_host is "$1"
else
   proxy_server_host=localhost
  #  echo proxy_server_host is "$1"
fi

http_proxy_port=1081
socks_proxy_port=1080
export http_proxy=http://${proxy_server_host}:${http_proxy_port}
export socks_proxy=socks5://${proxy_server_host}:${socks_proxy_port}
export https_proxy=${http_proxy}
export ALL_PROXY=${http_proxy}

# echo http_proxy: "$http_proxy"
# echo socks_proxy: "$socks_proxy"
echo -e "\033[32m[http_proxy ] \033[0m"${http_proxy}
echo -e "\033[32m[socks_proxy] \033[0m"${socks_proxy}
