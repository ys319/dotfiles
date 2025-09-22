{
  imports = [
    ./brew.nix
    ./nixlang.nix
    ./system.nix
    ./zsh.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
