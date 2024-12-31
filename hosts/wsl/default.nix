{ nixos-wsl, ... }:

{
  imports = [
    nixos-wsl.nixosModules.default

    ../../nixos/base
    ../../nixos/users
  ];

  wsl.enable = true;
  wsl.interop.register = true;
  wsl.defaultUser = "gecko";

  networking.hostName = "wsl";
}
