{ pkgs, nixos-hardware, ... }:

{
  imports = [
    # Hardware
    ./hardware.nix

    # Hardware modules
    nixos-hardware.nixosModules.common-pc-ssd
    nixos-hardware.nixosModules.common-cpu-amd-pstate
    nixos-hardware.nixosModules.common-gpu-amd-sea-islands

    # Features
    ../../nixos/base

    # Applications
    ../../nixos/appimage.nix
    ../../nixos/docker.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/users.nix
  ];

  # Use zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  # Networking
  networking.useDHCP = false;
  networking.interfaces.enp9s0 = {
    useDHCP = false;
    wakeOnLan.enable = true;
    ipv4.addresses = [{
      address = "10.10.1.10";
      prefixLength = 16;
    }];
  };
  networking.defaultGateway = "10.10.1.1";
  networking.nameservers = [ "10.10.1.1" ];

  # OpenSSH
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    settings.PermitRootLogin = "no";
  };
}
