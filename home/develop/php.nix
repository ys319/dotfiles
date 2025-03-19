{ pkgs, ... }: {
  home = {
    # sessionPath = [ "$HOME/.bun/bin" ];
    packages = with pkgs; [
      php84
      php84Packages.composer
      laravel
    ];
  };
}
