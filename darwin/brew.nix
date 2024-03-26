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
      "audacity"
      "firefox"
      "obs"
      "typora"
      "vlc"
      "wezterm"
      "zed"
      "gimp"
      "inkscape"

      # insomnia

      # Fonts
      "font-monaspace"
      "font-monaspace-nerd-font"
    ];

    # google-chrome
    # wireshark
    # arduino-ide
    # bitwarden
    # cloudflare-warp
    # hot
    # mpv

    # dotnet-sdk
    # unity-hub
  };
}
