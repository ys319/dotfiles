{ pkgs, ... }: {

  home.packages = with pkgs; [

    # Cloud Tools
    terraform
    hasura-cli
    slack-cli
    # wrangler

    # Multimedia Tools
    # nix-shell -p "sox.override { enableLame = true; }"
    (sox.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs ++ [ lame ];
    }))

    ffmpeg
    imagemagick
    poppler_utils
    libwebp

    # AI power
    openai-whisper-cpp

    # Modern CLI Tools
    hurl
    pv
    jq
    tig
    bench
  ];
}
