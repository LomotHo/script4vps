#!/bin/bash

USER_NAME=${USER_NAME:-lomot}
USER_HOME=${USER_HOME:-/home/$USER_NAME}

chown -R $USER_NAME:$USER_NAME $USER_HOME
# chown root:root /home