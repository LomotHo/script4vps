#!/bin/bash
# Module: docker — install docker and add user to docker group

apt-get update -qq
apt-get install -y docker.io

systemctl start docker
systemctl enable docker

groupadd -f docker
gpasswd -a "$USER_NAME" docker

log-info "Docker installed, ${USER_NAME} added to docker group"
