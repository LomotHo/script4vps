#!/bin/bash

function log-debug() {
    echo -e "\033[37m[debug] $1\033[0m"
}

function log-info() {
    echo -e "\033[32m[info] $1\033[0m"
}

function log-warn() {
    echo -e "\033[33m[warning] $1\033[0m"
}

function log-error() {
    echo -e "\033[31m[error] $1\033[0m"
}
