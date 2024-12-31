{ pkgs, profile, ... }: {

  # 
  programs = {

    # Git
    git = {
      enable = true;

      # Generate config
      extraConfig = {
        user = profile.git;
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
