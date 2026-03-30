#!/usr/bin/env zsh
set -euo pipefail

cd ${0:A:h}

if [[ $# -ne 1 ]]; then
    echo "Usage: ${0} [host]" >&2
    exit 1
fi

# Setup Nix Darwin
nix run nix-darwin --extra-experimental-features flakes --extra-experimental-features nix-command -- --flake ".#$1" switch
