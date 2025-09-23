#! /usr/bin/env nix-shell
#! nix-shell -i bash -p coreutils gnugrep pciutils

devices=$(
    lspci -nn \
    | grep -iP "nvidia" \
    | grep -oP "[0-9a-f]{4}:[0-9a-f]{4}" \
    | tr "\n" "," \
    | sed s/,$//
)

echo $devices
