{
  outputs = { nixpkgs, ... }@inputs:
    let

      # Lib
      lib = nixpkgs.lib;

      # Import hosts
      hosts = import ./hosts;

      # Import modules
      mkHome = import ./lib/mkHome.nix;
      mkModules = import ./lib/mkModules.nix { inherit lib; };
      mkSystem = import ./lib/mkSystem.nix;

      # Create systemInputs
      nixos = mkModules ./nixos;
      darwin = mkModules ./darwin;
      systemInputs = inputs // { inherit nixos darwin; };

      # NixOS
      nixosConfig = mkSystem "nixos" systemInputs;

      # Darwin
      darwinConfig = mkSystem "darwin" systemInputs;

      # Home Manager
      homeConfig = mkHome inputs;
    in
    {

      # Expose modules
      inherit nixos;

      # Setup home-manager
      homeConfigurations = lib.mapAttrs homeConfig hosts;

      # Setup nix-darwin
      darwinConfigurations = lib.mapAttrs darwinConfig hosts;

      # Setup nixos
      nixosConfigurations = lib.mapAttrs nixosConfig hosts;
    };

  inputs = {

    # Nixpkgs
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix Darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS Hardware
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    # NixOS WSL
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay.url = "github:oxalica/rust-overlay";
  };
}
