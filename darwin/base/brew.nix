{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    caskArgs.appdir = "/Applications/HomeBrew";

    # taps = [
    # ];

    brews = [
      "ys319/tap/jotty"
    ];

    casks = [

      # Browser
      "firefox"
      "google-chrome"

      # Develop
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
      "keepassxc"
      "slack"
      "smoothcsv"
      "typora"

      # Fonts
      "font-monaspice-nerd-font"
    ];
  };
}
