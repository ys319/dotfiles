let username = "gecko"; in {

  # Work laptop
  gecko-mac = {

    # nixpkgs system
    system = "aarch64-darwin";

    # feature modules
    features = [ "develop" ];

    # home-manager user config
    username = username;
  };

  # WSL
  wsl = {
    system = "x86_64-linux";
    features = [ "develop" ];
    username = username;
  };

  # rpi01
  rpi01 = {
    system = "aarch64-linux";
    features = [ "develop" ];
    username = username;
  };

  # srv01
  srv01 = {
    system = "x86_64-linux";
    features = [ "develop" ];
    username = username;
  };

  # x270
  x270 = {
    system = "x86_64-linux";
    features = [ "apps" "develop" ];
    username = username;
  };

  # trx
  trx = {
    system = "x86_64-linux";
    features = [ "develop" ];
    username = username;
  };
}
