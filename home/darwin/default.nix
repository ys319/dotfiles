{ pkgs, lib, ... }:
{
  home.packages = [
    pkgs.duti
  ];

  home.activation = {
    setFileAssociation = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo "Setting file associations with duti..."
      ${pkgs.duti}/bin/duti ~/.duti.conf
    '';
  };

  home.file = {
    ".duti.conf".text = ''
      # VS Code
      com.microsoft.VSCode public.source-code	all
      com.microsoft.VSCode public.plain-text all
      com.microsoft.VSCode .xml all
      com.microsoft.VSCode .md all
    '';
  };
}
