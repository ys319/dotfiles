{ pkgs, ... }: {

  home.packages = with pkgs; [

    # Cloud tools
    terraform
    hasura-cli

    # wrangler

    # Multimedia tools
    (sox.override { enableLame = true; })
    ffmpeg
    imagemagick
    poppler_utils
    libwebp

    # AI tools
    openai-whisper-cpp

    # Modern cli tools
    hurl
    pv
    jq
    tig
    bench
    rclone

    # Penetration tools
    rustscan
  ];
}
