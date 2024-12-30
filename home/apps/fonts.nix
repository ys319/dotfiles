{ pkgs, ... }: {

  # Enable fontconfig
  fonts.fontconfig.enable = true;

  # Add font packages
  home.packages = with pkgs; [
    hack-font
    monaspace
  ];
}
