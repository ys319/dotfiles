{ pkgs, ... }: {
  home = {
    packages = with pkgs; [ volta ];
    sessionPath = [ "$HOME/.volta/bin" ];
  };
}
