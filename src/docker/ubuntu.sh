#!/bin/bash

apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
gpasswd -a $USER docker
newgrp docker
echo "run 'newgrp docker' in usermode"
