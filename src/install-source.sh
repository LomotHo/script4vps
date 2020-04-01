#!/bin/bash

USER_NAME=${USER_NAME:-lomot}
USER_HOME=${USER_HOME:-/home/$USER_NAME}
SCRIPT4VPS_HOME=${SCRIPT4VPS_HOME:-${USER_HOME}/.script4vps}
VPS_CONFIG_HOME=${VPS_CONFIG_HOME:-${USER_HOME}/.script4vps/config}
OS=${OS:-$(source /etc/os-release; echo $ID)}
OS_VERSION=${OS_VERSION:-$(source /etc/os-release; echo $VERSION_ID)}

# SOURCE_LIST_HOME=${SOURCE_LIST_HOME:-${SCRIPT4VPS_HOME}/src/china-source}
SOURCE_LIST_HOME=${SOURCE_LIST_HOME:-./china-source}

# install source
case ${OS} in
ubuntu)
    case ${OS_VERSION} in
    "18.04"|"16.04"|"14.04")
        mv /etc/apt/sources.list /etc/apt/sources.list.ori
        cp ${SOURCE_LIST_HOME}/ubuntu${OS_VERSION}.sources.list /etc/apt/sources.list
        ;;
    *)
        log-error "ubuntu"${OS_VERSION}" not support"
        ;;
    esac
    ;;
debian)
    case ${OS_VERSION} in
    "10"|"9")
        mv /etc/apt/sources.list /etc/apt/sources.list.ori
        cp ${SOURCE_LIST_HOME}/debian${OS_VERSION}.sources.list /etc/apt/sources.list
        ;;
    *)
        log-error "debian"${OS_VERSION}" not support"
        ;;
    esac
    ;;
esac
