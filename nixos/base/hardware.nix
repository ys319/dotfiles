{ lib, ... }:

{

  # Additional firmware
  hardware.enableRedistributableFirmware = lib.mkDefault true;
}
