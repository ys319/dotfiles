{ pkgs, ... }: {

  home.packages = with pkgs; [

    # data-science
    xan
    jupyter

    # Cloud tools
    terraform
    hasura-cli
    cloudflared
    supabase-cli
    google-cloud-sdk

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
    xh

    # Penetration tools
    rustscan
  ];
}
