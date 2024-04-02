{ home-config, lib, ... }: {

  # Programs
  imports = [

    # Configure programs
    ./git.nix
    ./zsh.nix

    # Add utils
    ./utils.nix
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Home directory
  home = {
    username = home-config.username;
    homeDirectory = home-config.homeDirectory;
    stateVersion = "23.11";
  };

  # Silence news
  news = {
    display = "silent";
    json = lib.mkForce { };
    entries = lib.mkForce [ ];
  };
}
