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

      # Tools
      "firefox"
      "typora"
      "keepassxc"
      "smoothcsv"

      # Fonts
      "font-monaspice-nerd-font"

      # Driver
      # "wacom-tablet"
    ];
  };
}
