#!/bin/bash

USER_NAME=${USER_NAME:-lomot}

apt update
apt install docker.io -y
systemctl start docker
systemctl enable docker
groupadd docker
gpasswd -a $USER_NAME docker
newgrp docker

# mkdir -p /etc/docker
# tee /etc/docker/daemon.json <<-'EOF'
# {
# 	"registry-mirrors": [
# 		"https://docker.mirrors.ustc.edu.cn"
# 	]
# }
# EOF

# systemctl daemon-reload
# systemctl restart docker
