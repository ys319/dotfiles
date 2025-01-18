#!/usr/bin/env zsh

cd ${0:A:h}

if [[ $# -ne 1 ]]; then
    echo "Usage: ${0} [host]" >&2
    exit
fi

# Setup Nix Darwin
nix run nix-darwin --extra-experimental-features flakes --extra-experimental-features nix-command -- --flake ".#$1" switch
