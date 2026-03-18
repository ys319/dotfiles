{ pkgs, ... }:
{

  programs = {

    git = {
      enable = true;

      ignores = [
        "*~"
        ".DS_Store"
        ".claude/settings.local.json"
      ];

      settings = {
        user.name = "Yoshimasa Kuroyama";
        user.email = "66538624+ys319@users.noreply.github.com";
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        http.postBuffer = 524288000;
        ghq.root = "~/repo";
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
