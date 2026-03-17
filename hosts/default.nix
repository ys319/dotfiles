{

  # MacBook Air M2
  m2 = {
    system = "aarch64-darwin";
    features = [ "darwin" "develop" ];
  };

  # MacBook Air M5
  m5 = {
    system = "aarch64-darwin";
    features = [ "darwin" "develop" ];
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
}
