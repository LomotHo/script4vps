proxy_server_host=localhost
http_proxy_port=1081
socks_proxy_port=1080
export http_proxy=http://${proxy_server_host}:${http_proxy_port}
export socks_proxy=socks5://${proxy_server_host}:${socks_proxy_port}
export https_proxy=${http_proxy}
export ALL_PROXY=${http_proxy}
