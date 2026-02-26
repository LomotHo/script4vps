#!/bin/bash
echo -e "\033[32m[help] \033[0m"run source setproxy.sh

proxy_server_host=localhost
http_proxy_port=1081
socks_proxy_port=1080

if [ "$1" != '' ]; then
   proxy_server_host=$1
fi

if [ "$2" != '' ]; then
   http_proxy_port=$2
   if [ "$3" != '' ]; then
     socks_proxy_port=$3
    else
     socks_proxy_port=$2
   fi
fi

export http_proxy=http://${proxy_server_host}:${http_proxy_port}
export socks_proxy=socks5://${proxy_server_host}:${socks_proxy_port}
export https_proxy=${http_proxy}
export ALL_PROXY=${http_proxy}
export no_proxy="localhost"

echo -e "\033[32m[http_proxy ] \033[0m"${http_proxy}
echo -e "\033[32m[socks_proxy] \033[0m"${socks_proxy}
