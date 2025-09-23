{ pkgs, ... }: {

  programs = {

    git = {
      enable = true;
      userEmail = "66538624+ys319@users.noreply.github.com";
      userName = "Yoshimasa Kuroyama";
      extraConfig = {
        ghq = {
          "root" = "~/repo";
        };
      };
    };

    gh = {
      enable = true;
    };
  };

  # Ghq
  home.packages = with pkgs; [ ghq ];
}
