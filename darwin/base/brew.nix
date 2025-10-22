{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    caskArgs.appdir = "/Applications/HomeBrew";

    taps = [
      "ys319/homebrew-tap"
    ];

    brews = [
      "jotty"

      # # Unity
      # "mono"
    ];

    casks = [

      # Develop
      # "arduino-ide"
      "container"
      "cyberduck"
      "docker-desktop"
      "fleet"
      "ghostty"
      # "insomnia"
      "visual-studio-code"
      "wezterm"
      "zed"
      # "watchfacestudio"
      "android-platform-tools"

      # Multimedia
      "audacity"
      "blender"
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
      "wacom-tablet"

      # AI Tools
      "lm-studio"
    ];
  };
}
