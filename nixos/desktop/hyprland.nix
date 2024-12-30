{ pkgs, ... }: {

  # Environment variables
  environment = {

    # Force ozone in wayland
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  # Enable hyprland
  programs.hyprland.enable = true;

  # Additional packages
  packages = with pkgs; [
    # temporary
    kitty
    wofi
  ];
}
