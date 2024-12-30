{ pkgs, ... }: {

  imports = [
    ./fonts.nix
  ];

  home.packages = with pkgs;
    [
      discord
      gimp
      google-chrome
      vscode-fhs
      wezterm
      wireshark
      keepassxc
      bambu-studio
    ];
}
