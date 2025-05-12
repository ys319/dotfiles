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

    brews = [

      # Unity
      "mono"
    ];

    casks = [

      # Develop
      # "arduino-ide"
      "cyberduck"
      "docker"
      "fleet"
      "ghostty"
      # "insomnia"
      "visual-studio-code"
      "wezterm"
      # "zed"

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

      # Fonts
      "font-monaspace"
      "font-monaspace-nerd-font"

      # Driver
      "wacom-tablet"

      # Unity
      "dotnet-sdk"
    ];
  };
}
