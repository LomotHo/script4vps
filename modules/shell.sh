#!/bin/bash
# Module: shell — deploy zsh/tmux/vim/git configs and set default shell

USER_HOME=$(eval echo "~${USER_NAME}")
SCRIPT4VPS_HOME="${USER_HOME}/.script4vps"
CONFIG_HOME="${SCRIPT4VPS_HOME}/config"

# Clone or copy repo to ~/.script4vps
if [[ "$SCRIPT_DIR" == "$SCRIPT4VPS_HOME" ]]; then
    log-info "Already running from ${SCRIPT4VPS_HOME}"
else
    if [[ -d "$SCRIPT4VPS_HOME" ]]; then
        log-warn "${SCRIPT4VPS_HOME} exists, removing and re-copying"
        rm -rf "${SCRIPT4VPS_HOME}"
        cp -a "${SCRIPT_DIR}" "${SCRIPT4VPS_HOME}"
    else
        cp -a "${SCRIPT_DIR}" "${SCRIPT4VPS_HOME}"
    fi
fi

# Validate theme
THEME="${THEME:-vps}"
THEME_FILE="${CONFIG_HOME}/themes/${THEME}.p10k.zsh"
if [[ ! -f "$THEME_FILE" ]]; then
    log-error "Theme not found: ${THEME} (looked for ${THEME_FILE})"
    exit 1
fi
log-info "Using theme: ${THEME}"

# Symlink config files (remove existing targets first)
declare -A LINKS=(
    ["${USER_HOME}/.zshrc"]="${CONFIG_HOME}/zshrc"
    ["${USER_HOME}/.p10k.zsh"]="${THEME_FILE}"
    ["${USER_HOME}/.tmux.conf"]="${CONFIG_HOME}/tmux.conf"
    ["${USER_HOME}/.vimrc"]="${CONFIG_HOME}/vimrc"
    ["${USER_HOME}/.gitconfig"]="${CONFIG_HOME}/gitconfig"
)

for target in "${!LINKS[@]}"; do
    src="${LINKS[$target]}"
    rm -f "$target"
    ln -s "$src" "$target"
    log-info "Linked $target -> $src"
done

# Decompress gitstatusd for current architecture
GITSTATUS_DIR="${SCRIPT4VPS_HOME}/vendor/powerlevel10k/gitstatus/usrbin"
ARCH=$(uname -m)
XZ_FILE="${GITSTATUS_DIR}/gitstatusd-linux-${ARCH}.xz"
BIN_FILE="${GITSTATUS_DIR}/gitstatusd-linux-${ARCH}"
if [[ -f "$XZ_FILE" && ! -f "$BIN_FILE" ]]; then
    xz -dk "$XZ_FILE"
    chmod +x "$BIN_FILE"
    log-info "Extracted gitstatusd for ${ARCH}"
fi

# Set ownership
chown -R "${USER_NAME}:${USER_NAME}" "$USER_HOME"

# Switch default shell to zsh (usermod works without PAM, unlike chsh)
usermod -s "$(which zsh)" "${USER_NAME}"
log-info "Default shell set to zsh for ${USER_NAME}"
