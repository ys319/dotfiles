{ lib, ... }: {

  # Set default time zone
  time.timeZone = lib.mkDefault "Asia/Tokyo";

  # Set default locale
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

  # Set default hostname
  networking.hostName = lib.mkDefault "nixos";

  # Use network-manager
  networking.networkmanager.enable = lib.mkDefault true;

  # Use DHCP
  networking.useDHCP = lib.mkDefault true;

  # Additional firmware
  hardware.enableRedistributableFirmware = lib.mkDefault true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # Don't change.
  system.stateVersion = "23.11";
}
