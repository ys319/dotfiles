#!/usr/bin/env zsh 

if [[ $# -ne 1 ]]; then
    echo "Usage: ${0} [host]" >&2
    exit
fi

nix run nix-darwin -- --flake ".#$1" switch
nix run home-manager -- --flake ".#$1" switch
