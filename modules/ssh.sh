#!/bin/bash
# Module: ssh — deploy authorized_keys

USER_HOME=$(eval echo "~${USER_NAME}")
SCRIPT4VPS_HOME="${USER_HOME}/.script4vps"
SSH_DIR="${USER_HOME}/.ssh"

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

cp "${SCRIPT4VPS_HOME}/config/authorized_keys" "${SSH_DIR}/authorized_keys"
chmod 600 "${SSH_DIR}/authorized_keys"
chown -R "${USER_NAME}:${USER_NAME}" "$SSH_DIR"

log-info "SSH key deployed to ${SSH_DIR}/authorized_keys"
