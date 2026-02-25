#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
VENDOR_DIR="$ROOT_DIR/vendor"
TMP_DIR="$ROOT_DIR/.tmp"

# Vendor dependencies (full clone)
declare -A VENDORS=(
    ["powerlevel10k"]="https://github.com/romkatv/powerlevel10k.git"
    ["fast-syntax-highlighting"]="https://github.com/zdharma-continuum/fast-syntax-highlighting.git"
)

# Oh My Zsh partial files to sync
OMZ_LIBS=(git.zsh nvm.zsh key-bindings.zsh theme-and-appearance.zsh history.zsh completion.zsh grep.zsh)
OMZ_PLUGINS=(sudo git common-aliases colored-man-pages z docker kubectl helm extract)

update_vendor() {
    local name="$1"
    local url="${VENDORS[$name]}"
    local target="$VENDOR_DIR/$name"

    if [[ -z "$url" ]]; then
        echo "Unknown vendor: $name"
        echo "Available vendors: ${!VENDORS[*]} omz"
        return 1
    fi

    echo "Updating $name..."
    rm -rf "$target"
    git clone --depth 1 "$url" "$target"
    rm -rf "$target/.git"

    # Cleanup unnecessary files
    case "$name" in
        fast-syntax-highlighting)
            rm -rf "$target/images"
            ;;
    esac

    echo "Updated $name"
}

update_omz() {
    echo "Updating omz (partial sync from ohmyzsh)..."

    local src="$TMP_DIR/ohmyzsh-latest"
    local dst="$VENDOR_DIR/omz"

    # Clone if not exists
    if [[ ! -d "$src" ]]; then
        mkdir -p "$TMP_DIR"
        git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "$src"
    else
        echo "Using cached $src (run 'git -C $src pull' to update)"
    fi

    # Update lib files
    for f in "${OMZ_LIBS[@]}"; do
        cp "$src/lib/$f" "$dst/lib/$f"
        echo "  Updated lib/$f"
    done

    # Update plugins
    for p in "${OMZ_PLUGINS[@]}"; do
        rm -rf "$dst/plugins/$p"
        cp -r "$src/plugins/$p" "$dst/plugins/$p"
        echo "  Updated plugins/$p"
    done

    # Cleanup unnecessary files
    rm -rf "$dst/plugins/z/img"

    echo "Updated omz"
}

update_all() {
    for name in "${!VENDORS[@]}"; do
        update_vendor "$name"
    done
    update_omz
}

show_help() {
    echo "Usage: $0 [vendor_name|--all]"
    echo ""
    echo "Update vendored dependencies."
    echo ""
    echo "Options:"
    echo "  --all     Update all vendors"
    echo "  --list    List available vendors"
    echo "  --help    Show this help"
    echo ""
    echo "Available vendors:"
    for name in "${!VENDORS[@]}"; do
        echo "  $name"
    done
    echo "  omz (partial sync)"
}

case "${1:-}" in
    --all)
        update_all
        ;;
    --list)
        for name in "${!VENDORS[@]}"; do
            echo "$name: ${VENDORS[$name]}"
        done
        echo "omz: https://github.com/ohmyzsh/ohmyzsh.git (partial)"
        ;;
    --help|-h|"")
        show_help
        ;;
    omz)
        update_omz
        ;;
    *)
        update_vendor "$1"
        ;;
esac
