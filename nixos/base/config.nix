{ self, pkgs, lib, ... }: {

  # Replace nix package with nixpkgs.nix
  nix.package = pkgs.nix;

  # Add flake to $NIX_PATH for nix-shell.
  nix.nixPath = lib.mkDefault [
    "nixpkgs=flake"
    "nixpkgs"
  ];

  # Optimize nix store
  nix.optimise.automatic = lib.mkDefault true;

  # Enable experimental features.
  nix.settings.experimental-features = lib.mkDefault [
    "nix-command"
    "flakes"
  ];

  # Enable GC
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 14d";
  } // (
    if pkgs.stdenv.isDarwin
    then { }
    else {
      dates = lib.mkDefault "weekly";
    }
  );

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;
}
