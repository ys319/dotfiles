{ pkgs, ... }: {

  home.packages = with pkgs; [

    # Traditional unix tools
    coreutils
    curl
    diffutils
    findutils
    gnugrep
    nkf
    parallel
    tmux
    tree
    wget
    gptfdisk
    procps
    gnutar
    gnused

    # Modern alternative tools
    bottom
    fping
    fzf
    go-task
    htop
    ripgrep
    unar
    xxHash

    # Server tool
    wakeonlan
  ];
}
