#!/bin/bash

USER_NAME=${USER_NAME:-lomot}
USER_HOME=${USER_HOME:-/home/$USER_NAME}

# add user
adduser $USER_NAME
usermod -aG sudo $USER_NAME