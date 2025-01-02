{ profile, ... }: {

  # Work laptop
  gecko-mac = {

    # nixpkgs system
    system = "aarch64-darwin";

    # feature modules
    features = [ "develop" ];

    # home-manager user config
    profile.homeDirectory = "/Users/${profile.username}";
  };

  # WSL
  wsl = {
    system = "x86_64-linux";
    features = [ "develop" ];
  };

  # rpi01
  rpi01 = {
    system = "aarch64-linux";
    features = [ "develop" ];
  };

  # srv01
  srv01 = {
    system = "x86_64-linux";
    features = [ "develop" ];
  };

  # x270
  x270 = {
    system = "x86_64-linux";
    features = [ "apps" "develop" ];
  };

  # trx
  trx = {
    system = "x86_64-linux";
    features = [ "apps" "develop" ];
  };
}
