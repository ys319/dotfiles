{ lib, ... }: {

  # Disable hot corner
  system.defaults = {

    # Better dock
    dock = {
      appswitcher-all-displays = true;
      autohide = true;
      largesize = 72;
      magnification = true;
      mineffect = "scale";
      minimize-to-application = true;
      mru-spaces = false;
      orientation = lib.mkDefault "bottom";
      show-process-indicators = true;
      show-recents = false;
      showhidden = true;
      static-only = false;
      tilesize = 64;

      # Disable all hot corner.
      wvous-tl-corner = 1;
      wvous-bl-corner = 1;
      wvous-tr-corner = 1;
      wvous-br-corner = 1;

      # persistent-apps = [
      #   "/System/Applications/Launchpad.app"
      #   "/System/Applications/Mission Control.app"
      # ];
    };

    # Better finder
    finder = {

      # Show path bar
      ShowPathbar = true;

      # Show status bar
      ShowStatusBar = true;

      # Search scope is current directory.
      FXDefaultSearchScope = "SCcf";

      # Silence exntension change dialog.
      FXEnableExtensionChangeWarning = false;

      # Default view is "List".
      FXPreferredViewStyle = "Nlsv";

      # Whether to always show file extensions.
      AppleShowAllExtensions = true;

      # Whether to always show hidden files.
      AppleShowAllFiles = true;
    };

    NSGlobalDomain = {

      # Enable dark mode
      AppleInterfaceStyle = "Dark";

      # Jump to the spot that’s clicked on the scroll bar.
      AppleScrollerPagingBehavior = true;

      # Disable press popup
      ApplePressAndHoldEnabled = false;

      # Whether to always show file extensions.
      AppleShowAllExtensions = true;

      # Whether to always show hidden files.
      AppleShowAllFiles = true;

      # When to show the scrollbars.
      AppleShowScrollBars = "Always";

      # Repeat start bounce
      InitialKeyRepeat = 15;

      # Repeat interval
      KeyRepeat = 2;

      # Silence nosy features.
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;

      # Unused features.
      NSDisableAutomaticTermination = true;
      NSDocumentSaveNewDocumentsToCloud = false;

      # Whether to enable smooth scrolling.
      # NSScrollAnimationEnabled = true;

      # System dialog
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;

      # Better keyboard
      "com.apple.keyboard.fnState" = true;
      "com.apple.mouse.tapBehavior" = 1;
      "com.apple.sound.beep.feedback" = 1;
      "com.apple.swipescrolldirection" = false;
    };

    # Kill the auto update
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;

    # Custom config
    CustomUserPreferences = {

      NSGlobalDomain = {
        # Disable tinting.
        "AppleReduceDesktopTinting" = 1;

        # Switch IME with CapsLock.
        "TISRomanSwitchState" = 1;
      };
    };
  };
}
