#!/bin/bash

source ./src/lib/color-log.sh

function run-script() {
    log-info "RUN ${2}"
    source "${1}"
    log-info "[OK] ${2}"
}
