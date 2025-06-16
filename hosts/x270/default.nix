{ pkgs, nixos-hardware, ... }:

{
  imports = [

    # Hardware configuration
    ./hardware.nix

    # Hardware module
    nixos-hardware.nixosModules.common-pc-laptop
    nixos-hardware.nixosModules.lenovo-thinkpad-x270

    # Features
    ../../nixos/base
    ../../nixos/budgie

    # Applications
    ../../nixos/appimage.nix
    ../../nixos/docker.nix
    ../../nixos/flatpak.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/users.nix
    ../../nixos/zram.nix
  ];

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ 5353 ];
}
