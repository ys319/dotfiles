{

  # Configure zsh
  programs.zsh = {
    enable = true;

    # Disable completion for speed.
    enableCompletion = false;
    enableBashCompletion = false;

    # Load nix daemon.
    interactiveShellInit = ''
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
          . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
    '';
  };
}
