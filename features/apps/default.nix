{ pkgs, ... }: {
  home.packages = with pkgs; [
    gimp
    inkscape
    wezterm

    # arduino-ide
    # bitwarden
    # cloudflare-warp
    # firefox
    # google-chrome
    # insomnia
    # obs-studio
    # vscode-fhs
    # wireshark

    # vlc
    # mpv
    # hot
    # unity-hub
  ];
}
