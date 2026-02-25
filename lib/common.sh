#!/bin/bash

# --- Logging ---

log-debug() { echo -e "\033[37m[debug] $1\033[0m"; }
log-info()  { echo -e "\033[32m[info]  $1\033[0m"; }
log-warn()  { echo -e "\033[33m[warn]  $1\033[0m"; }
log-error() { echo -e "\033[31m[error] $1\033[0m"; }

# --- Utilities ---

# Use sudo only when not root
if [[ "$(id -u)" -eq 0 ]]; then
    SUDO=""
else
    SUDO="sudo"
fi

run-module() {
    local script="$1" label="$2"
    log-info ">>> ${label}"
    source "${script}"
    log-info "<<< ${label} [OK]"
}

require-root() {
    if [[ "$(id -u)" -ne 0 ]]; then
        log-error "This script must be run as root"
        exit 1
    fi
}

detect-os() {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        OS_ID="$ID"
        OS_VERSION="$VERSION_ID"
    else
        log-error "Cannot detect OS: /etc/os-release not found"
        exit 1
    fi

    case "$OS_ID" in
        ubuntu|debian) ;;
        *)
            log-error "Unsupported OS: $OS_ID"
            exit 1
            ;;
    esac
}
