{ profile, lib, ... }: {

  # Programs
  imports = [
    ./git.nix
    ./zsh.nix
    ./utils.nix
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Home directory
  home = {
    username = profile.username;
    homeDirectory = profile.homeDirectory;
    stateVersion = "23.11";
  };

  # Silence news
  news = {
    display = "silent";
    json = lib.mkForce { };
    entries = lib.mkForce [ ];
  };
}
