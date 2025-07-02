{ pkgs, nixos-hardware, ... }:

{
  imports = [
    # Hardware
    ./hardware.nix

    # Hardware modules
    nixos-hardware.nixosModules.common-pc-ssd
    nixos-hardware.nixosModules.common-cpu-amd-pstate
    nixos-hardware.nixosModules.common-gpu-nvidia-nonprime

    # Features
    ../../nixos/base
    # ../../nixos/budgie

    # Applications
    # ../../nixos/appimage.nix
    ../../nixos/docker.nix
    # ../../nixos/flatpak.nix
    ../../nixos/nvidia.nix
    ../../nixos/systemd-boot.nix
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
  networking.interfaces.enp4s0 = {
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

  # Power
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    charger = {
      governor = "schedutil";
      turbo = "auto";
    };
  };
}
