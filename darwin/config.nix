{

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = lib.mkDefault true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
