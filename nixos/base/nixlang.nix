{ pkgs, lib, ... }:

{

  # Replace nix package with nixpkgs.nix
  nix.package = lib.mkDefault pkgs.nix;

  # Add flake to $NIX_PATH for nix-shell.
  nix.nixPath = lib.mkDefault [
    "nixpkgs=flake"
    "nixpkgs"
  ];

  # Enable experimental features.
  nix.settings.experimental-features = lib.mkDefault [
    "nix-command"
    "flakes"
  ];

  # Enable GC
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 14d";
    dates = lib.mkDefault "weekly";
  };

  # Optimize nix store
  nix.optimise.automatic = lib.mkDefault true;
}
