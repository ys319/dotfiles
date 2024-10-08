{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    caskArgs.appdir = "/Applications/HomeBrew";

    taps = [ ];

    brews = [ ];

    casks = [

      # Develop
      "arduino-ide"
      "cyberduck"
      "docker"
      "fleet"
      "insomnia"
      "visual-studio-code"
      "wezterm"
      "zed"

      "watchfacestudio"
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

      # Fonts
      "font-monaspace"
      "font-monaspace-nerd-font"

      # Configuration
      "wacom-tablet"
    ];
  };
}
