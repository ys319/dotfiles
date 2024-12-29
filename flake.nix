{
  outputs = { self, nixpkgs, ... }@inputs:
    let
      utils = import ./utils inputs;
      hosts = import ./hosts;
    in
    {

      # Setup home-manager
      homeConfigurations = nixpkgs.lib.mapAttrs utils.homeConfig hosts;

      # Setup nix-darwin
      darwinConfigurations = nixpkgs.lib.mapAttrs utils.darwinConfig hosts;
    };

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
    };
  };
}
