#!/bin/bash

USER_NAME=${USER_NAME:-lomot}
USER_HOME=${USER_HOME:-/home/$USER_NAME}

chown -R $USER_NAME:$USER_NAME $USER_HOME
# chown -R $USER_NAME:$USER_NAME $USER_HOME/.*

cd ${USER_HOME}

log-info "chsh -s $(which zsh)"
sudo -u ${USER_NAME} chsh -s $(which zsh)

log-info "newgrp docker"
sudo -u ${USER_NAME} newgrp docker
