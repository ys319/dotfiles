{ pkgs, ... }: {

  home.packages = with pkgs; [

    # I need these on server.
    coreutils-prefixed # g* Prefixed coreutil
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
