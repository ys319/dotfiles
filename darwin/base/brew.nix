{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
      extraFlags = [
        "--force-cleanup"
      ];
    };

    caskArgs.appdir = "/Applications/HomeBrew";

    # taps = [
    # ];

    brews = [
      "ys319/tap/jotty"
      "llama.cpp"
    ];

    casks = [

      # Browser
      "firefox"
      "google-chrome"

      # Develop
      "claude"
      "cyberduck"
      "docker-desktop"
      "ghostty"
      "visual-studio-code"

      # Multimedia
      "gimp"
      "inkscape"
      "obs"
      "vlc"

      # Productivity
      "dropbox"
      "google-drive"
      "keepassxc"
      "smoothcsv"
      "typora"

      # Fonts
      "font-monaspice-nerd-font"

      # From App Store
      # "slack"

      # AI
      "lm-studio"
    ];
  };
}
