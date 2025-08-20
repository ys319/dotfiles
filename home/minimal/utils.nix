{ pkgs, ... }: {

  home.sessionPath = [ "$HOME/bin" ];

  home.packages = with pkgs; [

    # Traditional unix tools
    coreutils
    curl
    diffutils
    findutils
    gnugrep
    gnused
    gnutar
    gptfdisk
    nkf
    parallel
    procps
    tmux
    tree
    wget

    # Modern alternative tools
    bottom
    fping
    fzf
    go-task
    htop
    ripgrep
    ripunzip
    unar
    xxHash
    zstd

    # Server tool
    wakeonlan
  ];
}
