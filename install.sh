#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${SCRIPT_DIR}/lib/common.sh"

DEFAULT_MODULES=(base shell)
ALL_MODULES=(base shell ssh docker)
SELECTED_MODULES=()
USER_NAME="${USER_NAME:-$(whoami)}"
THEME="${THEME:-vps}"
USE_CN=false

show_help() {
    cat <<EOF
Usage: $0 [options]

Options:
  --modules <m1,m2,...>  Install specific modules (default: base,shell)
  --theme <name>         Set p10k theme: vps, mac, ascii (default: vps)
  --list                 List available modules and themes
  --user <name>          Set target username (default: current user, auto-creates if needed)
  --cn                   Use China mirrors where applicable
  -h, --help             Show this help

Available modules: ${ALL_MODULES[*]}
Available themes:  vps (pure style), mac (rainbow nerdfont), ascii (ASCII only)
EOF
}

list_modules() {
    log-info "Available modules:"
    echo "  base   - Install essential packages (htop, vim, tmux, zsh, git, curl)"
    echo "  shell  - Deploy zsh/tmux/vim/git configs, set default shell to zsh"
    echo "  ssh    - Deploy SSH authorized_keys"
    echo "  docker - Install Docker and configure user access"
    echo ""
    echo "Note: When --user specifies a different user, it will be created automatically."
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
        --theme)
            THEME="$2"
            shift 2
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
    SELECTED_MODULES=("${DEFAULT_MODULES[@]}")
fi
detect-os

export SCRIPT_DIR USER_NAME THEME USE_CN

log-info "OS detected: ${OS_ID} ${OS_VERSION}"
log-info "Target user: ${USER_NAME}"
log-info "Theme: ${THEME}"
log-info "Modules: ${SELECTED_MODULES[*]}"
echo ""

NEED_CREATE_USER=false
if [[ "$USER_NAME" != "$(whoami)" && "$USER_NAME" != "root" ]]; then
    NEED_CREATE_USER=true
fi

for mod in "${SELECTED_MODULES[@]}"; do
    mod_script="${SCRIPT_DIR}/modules/${mod}.sh"
    if [[ ! -f "$mod_script" ]]; then
        log-error "Module not found: ${mod}"
        exit 1
    fi
    run-module "$mod_script" "module: ${mod}"

    # Auto-create user after base module (sudo is now available)
    if [[ "$mod" == "base" && "$NEED_CREATE_USER" == "true" ]]; then
        run-module "${SCRIPT_DIR}/modules/user.sh" "module: user (auto)"
    fi
done

echo ""
log-info "All done!"

# Switch to zsh
if [[ "$USER_NAME" == "$(whoami)" ]]; then
    log-info "Switching to zsh..."
    exec zsh -l
else
    log-info "Run 'su - ${USER_NAME}' to switch to the new shell."
fi
