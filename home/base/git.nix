{ pkgs, ... }:
{

  programs = {

    git = {
      enable = true;
      settings = {
        user.email = "66538624+ys319@users.noreply.github.com";
        user.name = "Yoshimasa Kuroyama";
        ghq = {
          "root" = "~/repo";
        };
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
      };
    };
  };

  # Ghq
  home.packages = with pkgs; [ ghq ];
}
