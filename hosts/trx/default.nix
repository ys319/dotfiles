{ pkgs, nixos-hardware, ... }:

{
  imports = [
    # Hardware
    ./hardware.nix

    # Hardware modules
    nixos-hardware.nixosModules.common-pc-ssd
    nixos-hardware.nixosModules.common-cpu-intel
    nixos-hardware.nixosModules.common-gpu-intel
    nixos-hardware.nixosModules.common-gpu-nvidia-nonprime

    # Features
    ../../nixos/base
    ../../nixos/budgie

    # Applications
    ../../nixos/appimage.nix
    ../../nixos/docker.nix
    ../../nixos/flatpak.nix
    ../../nixos/nvidia.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/users.nix
    ../../nixos/zram.nix
  ];

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
}
