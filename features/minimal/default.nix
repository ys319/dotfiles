{ home-config, ... }: {

  # Enable home-manager
  programs.home-manager.enable = true;

  # Home directory
  home = {
    username = home-config.username;
    homeDirectory = home-config.homeDirectory;
    stateVersion = "23.11";
  };

  # Programs
  imports = [

    # Configure programs
    ./git.nix
    ./zsh.nix

    # Add utils
    ./utils.nix
  ];
}
