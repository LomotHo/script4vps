#!/bin/bash
# Module: base — install essential packages

export DEBIAN_FRONTEND=noninteractive

if [[ "$USE_CN" == "true" ]]; then
    log-info "Switching apt sources to mirrors.tuna.tsinghua.edu.cn"
    # Use http:// for bootstrap (ca-certificates may not be installed yet)
    sed -i \
        -e 's|https\?://archive.ubuntu.com|http://mirrors.tuna.tsinghua.edu.cn|g' \
        -e 's|https\?://security.ubuntu.com|http://mirrors.tuna.tsinghua.edu.cn|g' \
        -e 's|https\?://ports.ubuntu.com|http://mirrors.tuna.tsinghua.edu.cn|g' \
        -e 's|https\?://deb.debian.org|http://mirrors.tuna.tsinghua.edu.cn|g' \
        -e 's|https\?://security.debian.org|http://mirrors.tuna.tsinghua.edu.cn|g' \
        /etc/apt/sources.list 2>/dev/null || true
    # Ubuntu 24.04+ uses deb822 format
    if [[ -d /etc/apt/sources.list.d ]]; then
        sed -i \
            -e 's|https\?://archive.ubuntu.com|http://mirrors.tuna.tsinghua.edu.cn|g' \
            -e 's|https\?://security.ubuntu.com|http://mirrors.tuna.tsinghua.edu.cn|g' \
            -e 's|https\?://ports.ubuntu.com|http://mirrors.tuna.tsinghua.edu.cn|g' \
            /etc/apt/sources.list.d/*.sources 2>/dev/null || true
        sed -i \
            -e 's|https\?://deb.debian.org|http://mirrors.tuna.tsinghua.edu.cn|g' \
            -e 's|https\?://security.debian.org|http://mirrors.tuna.tsinghua.edu.cn|g' \
            /etc/apt/sources.list.d/*.list 2>/dev/null || true
    fi
fi

apt-get update -qq
apt-get install -y htop sudo vim net-tools tmux zsh git curl xz-utils
