{ lib, pkgs, ... }: {

  # Programs
  imports = [
    ./git.nix
    ./zsh.nix
    ./utils.nix
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Home directory
  home = rec {
    username = "gecko";
    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${username}"
      else "/home/${username}";
    stateVersion = "23.11";
  };

  # Silence news
  news = {
    display = "silent";
    json = lib.mkForce { };
    entries = lib.mkForce [ ];
  };

  # Enable GC
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 14d";
    dates = lib.mkDefault "weekly";
  };
}
