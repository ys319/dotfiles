{ pkgs, ... }: {
  home = {
    # sessionPath = [ "$HOME/.bun/bin" ];
    packages = with pkgs; [ bun ];
  };
}
