#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENDOR_DIR="$(dirname "$SCRIPT_DIR")/vendor"

# Vendor dependencies
declare -A VENDORS=(
    ["powerlevel10k"]="https://github.com/romkatv/powerlevel10k.git"
    ["fast-syntax-highlighting"]="https://github.com/zdharma-continuum/fast-syntax-highlighting.git"
)

update_vendor() {
    local name="$1"
    local url="${VENDORS[$name]}"
    local target="$VENDOR_DIR/$name"

    if [[ -z "$url" ]]; then
        echo "Unknown vendor: $name"
        echo "Available vendors: ${!VENDORS[*]}"
        return 1
    fi

    echo "Updating $name..."
    rm -rf "$target"
    git clone --depth 1 "$url" "$target"
    rm -rf "$target/.git"
    echo "Updated $name"
}

update_all() {
    for name in "${!VENDORS[@]}"; do
        update_vendor "$name"
    done
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
}

case "${1:-}" in
    --all)
        update_all
        ;;
    --list)
        for name in "${!VENDORS[@]}"; do
            echo "$name: ${VENDORS[$name]}"
        done
        ;;
    --help|-h|"")
        show_help
        ;;
    *)
        update_vendor "$1"
        ;;
esac
