{ lib, ... }:

{

  # Set default hostname
  networking.hostName = lib.mkDefault "nixos";

  # Use network-manager
  networking.networkmanager.enable = lib.mkDefault true;

  # Use DHCP
  networking.useDHCP = lib.mkDefault true;
}
