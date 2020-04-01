#!/bin/bash

USER_NAME=${USER_NAME:-lomot}
OS=${OS:-$(source /etc/os-release; echo $ID)}
OS_VERSION=${OS_VERSION:-$(source /etc/os-release; echo $VERSION_ID)}

apt-get remove docker docker-engine docker.io containerd runc
apt-get update

case $OS in
ubuntu)
    apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"
    ;;
debian)
    apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable"
    ;;
esac

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start docker
gpasswd -a $USER_NAME docker
newgrp docker
echo "run 'newgrp docker' in usermode"
