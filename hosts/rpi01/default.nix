{
  pkgs,
  nixos,
  nixos-hardware,
  ...
}:

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
    ipv4.addresses = [
      {
        address = "10.1.2.1";
        prefixLength = 8;
      }
    ];
  };
  networking.defaultGateway = "10.0.0.1";
  networking.nameservers = [ "10.0.0.1" ];

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

  # flashrom 1.8.0 fails its test suite on aarch64-linux (NixOS/nixpkgs#558302),
  # which breaks raspberrypi-eeprom below. tests/chip.c setup_bad_chip() keeps a
  # pointer to a stack-local mock_chip in flashctx->chip after returning; the
  # patch makes it static. Not fixed upstream yet — drop this once nixpkgs builds.
  nixpkgs.overlays = [
    (_: prev: {
      flashrom = prev.flashrom.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [ ./flashrom-dangling-mock-chip.patch ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
  ];
}
