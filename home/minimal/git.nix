{ pkgs, ... }: {

  # 
  programs = {

    # Git
    git = {
      enable = true;

      # Generate config
      extraConfig = {
        user = {
          name = "Yoshimasa Kuroyama";
          email = "66538624+ys319@users.noreply.github.com";
        };
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
