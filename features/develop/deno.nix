{ pkgs, ... }: {
  home = {
    packages = with pkgs; [ deno ];
    sessionPath = [ "$HOME/.deno/bin" ];
  };
}
