{
  home.sessionVariables = {
    SKIM_TMUX_HEIGHT = "100%";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Use cache
    completionInit = ''
      autoload -Uz compinit
      [[ -f "''${ZDOTDIR:-$HOME}/.zcompdump" ]] \
        && (compinit -C; compinit &) \
        || compinit
    '';

    # Zsh plugins
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # History
    history = {
      size = 1000000;
      share = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
      ignoreAllDups = true;
      expireDuplicatesFirst = true;
    };

    # Zsh profile
    # zprof.enable = true;
  };

  programs.starship.enable = true;

  # programs.fzf.enable = true;

  programs.skim.enable = true;

  programs.eza.enable = true;
}
