{ pkgs, ... }: {
  home.packages = with pkgs; [

    # Cloud Tools
    terraform
    hasura-cli
    slack-cli
    # wrangler

    # Multimedia Tools
    sox
    poppler
    imagemagick

    # Modern CLI Tools
    hurl
    pv
    jq
    tig
    bench
  ];
}
