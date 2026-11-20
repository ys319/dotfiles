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
      # Formatter (per-system)
      eachSystem = lib.genAttrs [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
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

      # Formatter
      formatter = eachSystem (system: nixpkgs.legacyPackages.${system}.alejandra);
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
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS Hardware
    # nixpkgs は自身の formatter / checks 用のみ（モジュールは使う側の pkgs で評価される）
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS WSL
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Rust Overlay（overlay として読み込むので nixpkgs は lock 上の重複を避けるためだけに揃える）
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Bulkhead (nixpkgs は follows せず、bulkhead 側の flake.lock で固定されたものを使う)
    bulkhead.url = "github:ys319/bulkhead";
  };
}
