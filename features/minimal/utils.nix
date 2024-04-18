{ pkgs, ... }: {

  home.packages = with pkgs; [

    # I need these on server.
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
    bottom
    gnutar
    gnused

    # I love these tools.
    go-task
    htop
    ripgrep
    fzf
    fping
    xxHash
    unar
  ];
}
