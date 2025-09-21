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
      homeConfig = import ./lib/home.nix inputs;
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
