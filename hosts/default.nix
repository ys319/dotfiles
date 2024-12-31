{ profile, ... }: {

  # Work laptop
  gecko-mac = {

    # nixpkgs system
    system = "aarch64-darwin";

    # feature modules
    features = [
      "develop"
    ];

    # home-manager user config
    profile = {
      homeDirectory = "/Users/${profile.username}";
    };
  };

  # WSL
  wsl = {
    system = "x86_64-linux";
    features = [ "develop" ];
    profile = { };
  };
}
