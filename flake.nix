{
  outputs = { self, nixpkgs, ... }@inputs:
    let

      override = {
        profile = import ./profile.nix;
      };

      lib = nixpkgs.lib;
      hosts = import ./hosts (inputs // override);
      utils = import ./utils (inputs // override);
    in
    {

      # Setup nixos
      nixosConfigurations = lib.mapAttrs utils.nixosConfig hosts;

      # Setup nix-darwin
      darwinConfigurations = lib.mapAttrs utils.darwinConfig hosts;

      # Setup home-manager
      homeConfigurations = lib.mapAttrs utils.homeConfig hosts;
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    rust-overlay.url = "github:oxalica/rust-overlay";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
  };
}
