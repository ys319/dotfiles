{ pkgs, profile, ... }: {

  # 
  programs = {

    # Git
    git = {
      enable = true;

      # Generate config
      extraConfig = {
        ghq = {
          "root" = "~/repo";
        };
      };
    };

    # GitHub CLI
    gh = {
      enable = true;
    };
  };

  # Ghq
  home.packages = with pkgs; [ ghq ];
}
