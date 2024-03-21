{

  # Disable hot corner
  system.defaults = {

    # Better dock
    dock = {
      autohide = true;
      orientation = "bottom";
      show-process-indicators = true;

      # Hot corner
      wvous-tl-corner = 1;
      wvous-bl-corner = 1;
      wvous-tr-corner = 1;
      wvous-br-corner = 1;
    };

    # Better finder
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
    };

    NSGlobalDomain = {
      "com.apple.keyboard.fnState" = true;
    };
  };
}
