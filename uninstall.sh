#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${SCRIPT_DIR}/lib/common.sh"

log-info "Uninstalling script4vps..."

rm -f ~/.zshrc
rm -f ~/.p10k.zsh
rm -f ~/.tmux.conf
rm -f ~/.vimrc
rm -f ~/.gitconfig
rm -rf ~/.script4vps

log-info "Uninstall complete. You may want to run: chsh -s /bin/bash"
