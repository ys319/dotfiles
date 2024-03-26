{ pkgs, ... }: {

  xdg.configFile = {
    "sheldon/plugins.toml".source = ./sheldon/plugins.toml;
  };

  home = {

    # Set xdg's recommended
    sessionVariables = {
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      XDG_STATE_HOME = "\${HOME}/.local/state";
    };

    packages = with pkgs; [
      # sheldon
    ];
  };

  programs.zsh = {

    # Variable
    sessionVariables = { };

    # Enable
    enable = true;
    enableCompletion = true;

    # Tweaks
    autocd = true;

    # Hacking zsh
    initExtraBeforeCompInit = ''
      # Cache homebrew shellenv
      export HOMEBREW_BINERY="/opt/homebrew/bin/brew"
      export HOMEBREW_CACHEFILE="$XDG_CACHE_HOME/homebrew.zsh"
      if [[ ! -f "$HOMEBREW_CACHEFILE" || "$HOMEBREW_BINERY" -nt "$HOMEBREW_CACHEFILE" ]]; then
        echo "update: cache/brew"
        $HOMEBREW_BINERY shellenv > $HOMEBREW_CACHEFILE
      fi
      source "$HOMEBREW_CACHEFILE"
      unset HOMEBREW_BINERY HOMEBREW_CACHEFILE
    '';

    # Initialize sheldon
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
    initExtra = ''
      setopt auto_param_slash
      setopt auto_remove_slash
      setopt extended_glob
      setopt glob_complete
      setopt glob_dots
      setopt notify
    '';

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
  programs.fzf.enable = true;
  programs.eza.enable = true;
}
