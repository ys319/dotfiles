{
  imports = [
    ./brew.nix
    ./settings.nix
    ./zsh.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
