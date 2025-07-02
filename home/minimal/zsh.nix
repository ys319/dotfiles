{ pkgs, ... }: {

  xdg.configFile = {
    "sheldon/plugins.toml".source = ./zsh/plugins.toml;
  };

  home = {

    # Set xdg's recommended
    sessionVariables = {

      # XDG directory
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      XDG_STATE_HOME = "\${HOME}/.local/state";
    };

    packages = with pkgs; [
      sheldon
    ];
  };

  programs.zsh = {

    # Variable
    sessionVariables = {

      # 
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=8";
      ZSH_HIGHLIGHT_HIGHLIGHTERS = "(main brackets)";
    };

    # Enable
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;

    envExtra = ''
      if [[ -f ~/.zshenv.local ]]; then
        source ~/.zshenv.local
      fi
    '';

    # Activate shelldon
    completionInit = ''
      # Cache sheldon source
      export SHELDON_CONFIGFILE="$XDG_CONFIG_HOME/sheldon/plugins.toml"
      export SHELDON_LOCKFILE="$XDG_DATA_HOME/sheldon/plugins.lock"
      export SHELDON_CACHEFILE="$XDG_CACHE_HOME/sheldon.zsh"
      if [[ ! -f "$SHELDON_CACHEFILE" || "$SHELDON_CONFIGFILE" -nt "$SHELDON_CACHEFILE" || "$SHELDON_LOCKFILE" -nt "$SHELDON_CACHEFILE" ]]; then
        echo "update: cache/sheldon"
        sheldon source > $SHELDON_CACHEFILE
      fi
      source "$SHELDON_CACHEFILE"
      unset SHELDON_CONFIGFILE SHELDON_LOCKFILE SHELDON_CACHEFILE
    '';

    # Additionals tweaks
    initContent = builtins.concatStringsSep "\n" [
      (builtins.readFile zsh/alias.zsh)
      (builtins.readFile zsh/option.zsh)
      (builtins.readFile zsh/keybind.zsh)
      (builtins.readFile zsh/brew.zsh)
    ];

    # History
    history = {
      size = 65535;
      save = 65535;
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

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    defaultOptions = [
      "--select-1"
      "--exit-0"
      "--ansi"
      "--reverse"
      "--extended"
      "--cycle"
      "--height 60%"
    ];
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  # Enable 
  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
}
