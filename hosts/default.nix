# Host specific configuration
{

  # Work laptop
  gecko-mac = {

    # nixpkgs system
    system = "aarch64-darwin";

    # feature modules
    features = [
      "develop"
    ];

    # home-manager user config
    profile = rec {
      username = "gecko";
      homeDirectory = "/Users/${username}";
    };
  };
}
