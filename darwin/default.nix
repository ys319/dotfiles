{ self, pkgs, ... }: {

  imports = [
    ./brew.nix
    ./settings.nix
    ./zsh.nix
  ];

  # Replace nix package with nixpkgs.nix
  nix.package = pkgs.nix;

  # Enable exterimental features.
  nix.settings.experimental-features = "nix-command flakes";

  # Add flake to $NIX_PATH for nix-shell.
  nix.nixPath = [
    "nixpkgs=flake"
    "nixpkgs"
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # Sudo with Touch ID
  security.pam.enableSudoTouchIdAuth = true;
}
