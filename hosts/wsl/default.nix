{ nixos, nixos-wsl, ... }:

{
  imports = [

    # WSL modules
    nixos-wsl.nixosModules.default

    # Features
    nixos.base.default
    nixos.users.default
  ];

  wsl.enable = true;
  wsl.interop.register = true;
  wsl.defaultUser = "gecko";
  wsl.docker-desktop.enable = true;

  networking.hostName = "wsl";
}
