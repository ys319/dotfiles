{ pkgs, bulkhead, ... }: {
  home.packages = [
    bulkhead.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
