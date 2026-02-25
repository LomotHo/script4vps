#!/bin/bash
# Module: user — create user and grant sudo

if id "$USER_NAME" &>/dev/null; then
    log-info "User $USER_NAME already exists, skipping creation"
else
    adduser --disabled-password --gecos "" "$USER_NAME"
    log-info "User $USER_NAME created"
fi

usermod -aG sudo "$USER_NAME"
