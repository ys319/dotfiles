{ pkgs, ... }: {
  home.packages = with pkgs; [
    # nil
    nixd
    nixpkgs-fmt
  ];
}
