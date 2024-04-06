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
      "homebrew/cask-fonts"
    ];

    brews = [
      # TODO: Migrate to home-manager, if available 0.7.4 on nixpkgs.
      "sheldon"
    ];

    casks = [

      # Develop
      "visual-studio-code"
      "arduino-ide"
      "docker"
      "insomnia"
      "wezterm"
      "zed"

      # Multimedia
      "audacity"
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
    ];
  };
}
