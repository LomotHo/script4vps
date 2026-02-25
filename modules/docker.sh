#!/bin/bash
# Module: docker — install docker and add user to docker group

$SUDO apt-get update -qq
$SUDO apt-get install -y docker.io

$SUDO systemctl start docker
$SUDO systemctl enable docker

$SUDO groupadd -f docker
$SUDO gpasswd -a "$USER_NAME" docker

log-info "Docker installed, ${USER_NAME} added to docker group"
