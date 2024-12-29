{ pkgs, ... }: {
  home = {
    sessionPath = [ "$HOME/.deno/bin" ];
    packages = with pkgs; [ deno ];
  };
}
