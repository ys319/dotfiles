{
  outputs = { nixpkgs, ... }@inputs:
    let

      # Lib
      lib = nixpkgs.lib;
      hosts = import ./hosts; # inputs;

      # Import importer.
      importer = import ./lib/importers.nix { inherit lib; };

      # Import directory structrue.
      nixos = importer ./nixos;
      darwin = importer ./darwin;

      #
      extendedInputs = inputs // { inherit nixos darwin; };

      # NixOS
      nixosConfig = (import ./lib/mkSystem.nix extendedInputs) "nixos";

      # Darwin
      darwinConfig = (import ./lib/mkSystem.nix extendedInputs) "darwin";

      # Home Manager
      homeConfig = import ./lib/mkHome.nix extendedInputs;
    in
    {

      # Expose modules
      inherit nixos;

      # Setup nixos
      nixosConfigurations = lib.mapAttrs nixosConfig hosts;

      # Setup nix-darwin
      darwinConfigurations = lib.mapAttrs darwinConfig hosts;

      # Setup home-manager
      homeConfigurations = lib.mapAttrs homeConfig hosts;
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
