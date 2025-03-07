{ pkgs, ... }: {

  home.packages = with pkgs; [

    # notebook
    jupyter

    # Cloud tools
    terraform
    hasura-cli
    cloudflared
    supabase-cli

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
