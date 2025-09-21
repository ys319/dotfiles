{ pkgs, nixos-hardware, nixos, ... }:

{
  imports = [

    # Hardware configuration
    ./hardware.nix

    # Hardware module
    nixos-hardware.nixosModules.common-pc-laptop
    nixos-hardware.nixosModules.lenovo-thinkpad-x270

    # Features
    nixos.base.default
    nixos.bootloader.default
    nixos.desktop.budgie.default
    nixos.hardware.default
    nixos.users.gecko.default

    # Service
    nixos.services.docker
    nixos.services.flatpak
  ];

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
}
