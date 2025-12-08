{ pkgs, ... }:
{
  home = {
    sessionPath = [ "$HOME/go/bin" ];
    packages = with pkgs; [ go ];
  };
}
