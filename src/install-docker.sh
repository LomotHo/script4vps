#!/bin/bash

USER_NAME=${USER_NAME:-lomot}

apt update
apt install docker.io
systemctl start docker
systemctl enable docker
groupadd docker
gpasswd -a $USER_NAME docker
newgrp docker
