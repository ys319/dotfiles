{ pkgs, nixos-hardware, ... }:

{
  imports = [
    # Hardware
    ./hardware.nix

    # Hardware modules
    nixos-hardware.nixosModules.raspberry-pi-4

    # Features
    ../../nixos/base

    # Applications
    ../../nixos/appimage.nix
    ../../nixos/docker.nix
    ../../nixos/users.nix
    ../../nixos/zram.nix
  ];

  # Use zen kernel
  # boot.kernelPackages = pkgs.linuxPackages_zen;

  # Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  # Networking
  networking.useDHCP = false;
  networking.interfaces.end0 = {
    useDHCP = false;
    # wakeOnLan.enable = true;
    ipv4.addresses = [{
      address = "10.10.1.11";
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

  # Hardware
  services.hardware.argonone.enable = true;
  hardware = {
    enableRedistributableFirmware = true;
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    deviceTree = {
      enable = true;
      filter = "*rpi-4-*.dtb";
    };
  };

  console.enable = true;
  environment.systemPackages = with pkgs;[
    libraspberrypi
    raspberrypi-eeprom
  ];
}
