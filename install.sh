#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${SCRIPT_DIR}/lib/common.sh"

ALL_MODULES=(base user shell ssh docker)
SELECTED_MODULES=()
USER_NAME="${USER_NAME:-lomot}"
USE_CN=false

show_help() {
    cat <<EOF
Usage: $0 [options]

Options:
  --modules <m1,m2,...>  Install specific modules (default: all)
  --list                 List available modules
  --user <name>          Set target username (default: lomot)
  --cn                   Use China mirrors where applicable
  -h, --help             Show this help

Available modules: ${ALL_MODULES[*]}
EOF
}

list_modules() {
    log-info "Available modules:"
    echo "  base   - Install essential packages (htop, vim, tmux, zsh, git, curl)"
    echo "  user   - Create user and grant sudo"
    echo "  shell  - Deploy zsh/tmux/vim/git configs, set default shell to zsh"
    echo "  ssh    - Deploy SSH authorized_keys"
    echo "  docker - Install Docker and configure user access"
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --modules)
            IFS=',' read -ra SELECTED_MODULES <<< "$2"
            shift 2
            ;;
        --list)
            list_modules
            exit 0
            ;;
        --user)
            USER_NAME="$2"
            shift 2
            ;;
        --cn|-cn)
            USE_CN=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            log-error "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

if [[ ${#SELECTED_MODULES[@]} -eq 0 ]]; then
    SELECTED_MODULES=("${ALL_MODULES[@]}")
fi

require-root
detect-os

export SCRIPT_DIR USER_NAME USE_CN

log-info "OS detected: ${OS_ID} ${OS_VERSION}"
log-info "Target user: ${USER_NAME}"
log-info "Modules: ${SELECTED_MODULES[*]}"
echo ""

for mod in "${SELECTED_MODULES[@]}"; do
    mod_script="${SCRIPT_DIR}/modules/${mod}.sh"
    if [[ ! -f "$mod_script" ]]; then
        log-error "Module not found: ${mod}"
        exit 1
    fi
    run-module "$mod_script" "module: ${mod}"
done

echo ""
log-info "All done! Log in as ${USER_NAME} to enjoy your new shell."
