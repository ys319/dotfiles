{ pkgs, nixos, nixos-hardware, ... }:

{
  imports = [

    # Hardware
    ./hardware.nix

    # Hardware modules
    nixos-hardware.nixosModules.raspberry-pi-4

    # NixOS modules
    nixos.base.default
    nixos.hardware.default
    nixos.services.default
    nixos.users.default
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
      address = "10.1.2.1";
      prefixLength = 16;
    }];
  };
  networking.defaultGateway = "10.0.0.1";
  networking.nameservers = [ "10.0.0.1" ];

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
