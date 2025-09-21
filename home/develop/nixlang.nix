{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixd
    nixpkgs-fmt
  ];
}
