#!/usr/bin/env zsh
set -euo pipefail

cd ${0:A:h}

if [[ $# -ne 1 ]]; then
    echo "Usage: ${0} [host]" >&2
    exit 1
fi

# Setup NixOS
nixos-rebuild --flake ".#$1" switch
