{ lib, ... }: {

  # Primary user
  system.primaryUser = "gecko";

  # Sudo with Touch ID
  security.pam.services.sudo_local.touchIdAuth = true;

  # Disable chime
  system.startup.chime = false;

  # Override defaults
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

      persistent-apps = [
        "/Applications/Slack.app"
        "/Applications/Google Chrome.app"
        # "/Applications/HomeBrew/WezTerm.app"
        "/Applications/HomeBrew/Ghostty.app"
        "/Applications/HomeBrew/Visual Studio Code.app"
        "/Applications/Antigravity.app"
        "/Applications/HomeBrew/Typora.app"
        # "/Applications/HomeBrew/OBS.app"
      ];
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

      "NSGlobalDomain" = {

        # Accent colors
        "AppleAccentColor" = 4;
        "AppleHighlightColor" = "0.698039 0.843137 1.000000 Blue";

        # Small sidebar icons
        "NSTableViewDefaultSizeMode" = 1;

        # Disable tinting.
        "AppleReduceDesktopTinting" = 1;

        # Switch IME with CapsLock.
        "TISRomanSwitchState" = 1;

        # Keyboard
        "NSUserQuotesArray" = [ "\"" "\"" "'" "'" ];
        "KB_DoubleQuoteOption" = "\"abc\"";
        "KB_SingleQuoteOption" = "'abc'";

        # Spelling
        "KB_SpellingLanguage" = {
          "KB_SpellingLanguageIsAutomatic" = 1;
        };

        # Silence nosy features.
        "NSAutomaticInlinePredictionEnabled" = 0;

        # 
        "com.apple.trackpad.forceClick" = 0;
      };

      "com.apple.HIToolbox" = {

        # Disable earth key
        "AppleFnUsageType" = 0;
      };

      "com.apple.dock" = {

        # Remove download folder
        "persistent-others" = [ ];

        # 
        "showAppExposeGestureEnabled" = 1;
        "showDesktopGestureEnabled" = 0;
      };

      "com.apple.desktopservices" = {
        # Don't write .DS_Store
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };

      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
      };

      "com.apple.SoftwareUpdate" = {
        AutomaticCheckEnabled = true;
        # Check for software updates daily, not just once per week
        ScheduleFrequency = 1;
        # Download newly available updates in background
        AutomaticDownload = 1;
      };

      # 
      "com.apple.WindowManager" = {

        # Disable click to show desktop
        "EnableStandardClickToShowDesktop" = 0;

        "AppWindowGroupingBehavior" = 1;
        "AutoHide" = 0;
        "HasDisplayedShowDesktopEducation" = 1;
        "HideDesktop" = 1;
        "StageManagerHideWidgets" = 0;
        "StandardHideDesktopIcons" = 0;
        "StandardHideWidgets" = 0;
      };
    };
  };
}
