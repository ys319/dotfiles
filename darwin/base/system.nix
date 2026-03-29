{ lib, ... }: {

  # Primary user
  system.primaryUser = "gecko";

  # Sudo with Touch ID
  security.pam.services.sudo_local.touchIdAuth = true;

  # Disable chime
  system.startup.chime = false;

  system.defaults = {

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

      # Disable all hot corners.
      wvous-tl-corner = 1;
      wvous-bl-corner = 1;
      wvous-tr-corner = 1;
      wvous-br-corner = 1;

      persistent-apps = [
        "/Applications/HomeBrew/Google Chrome.app"
        "/Applications/HomeBrew/Ghostty.app"
        "/Applications/HomeBrew/Visual Studio Code.app"
        "/Applications/HomeBrew/Claude.app"
        "/Applications/HomeBrew/Typora.app"
        "/Applications/Slack.app"
      ];
    };

    finder = {
      ShowPathbar = true;
      ShowStatusBar = true;
      FXDefaultSearchScope = "SCcf"; # Search within current directory.
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv"; # List view.
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
    };

    NSGlobalDomain = {

      AppleInterfaceStyle = "Dark";
      AppleScrollerPagingBehavior = true; # Jump to the clicked spot on scroll bar.
      ApplePressAndHoldEnabled = false; # Disable press-and-hold character picker.
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      AppleShowScrollBars = "Always";

      # Lower = faster. Default: InitialKeyRepeat=25, KeyRepeat=6.
      InitialKeyRepeat = 15;
      KeyRepeat = 2;

      # Disable all automatic text correction.
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;

      NSDisableAutomaticTermination = true;
      NSDocumentSaveNewDocumentsToCloud = false;

      # Always expand save and print dialogs.
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;

      # Fn key shows F1-F12 instead of special features.
      "com.apple.keyboard.fnState" = true;
      "com.apple.mouse.tapBehavior" = 1; # Tap to click.
      "com.apple.sound.beep.feedback" = 1; # Play feedback on volume change.
      "com.apple.swipescrolldirection" = false; # Disable natural scrolling.
    };

    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;

    CustomUserPreferences = {

      "NSGlobalDomain" = {

        # Accent color: Blue.
        "AppleAccentColor" = 4;
        "AppleHighlightColor" = "0.698039 0.843137 1.000000 Blue";

        "NSTableViewDefaultSizeMode" = 1; # Small sidebar icons.
        "AppleReduceDesktopTinting" = 1;
        "TISRomanSwitchState" = 1; # Switch IME with CapsLock.

        # Use straight quotes instead of smart quotes.
        "NSUserQuotesArray" = [ "\"" "\"" "'" "'" ];
        "KB_DoubleQuoteOption" = "\"abc\"";
        "KB_SingleQuoteOption" = "'abc'";

        "KB_SpellingLanguage" = {
          "KB_SpellingLanguageIsAutomatic" = 1;
        };

        "NSAutomaticInlinePredictionEnabled" = 0;
        "com.apple.mouse.linear" = 1; # Disable mouse acceleration.
        "com.apple.trackpad.forceClick" = 0; # Disable force click.
      };

      "com.apple.HIToolbox" = {
        "AppleFnUsageType" = 0; # Disable Fn/Globe key popup (emoji picker).
      };

      "com.apple.dock" = {
        "persistent-others" = [ ]; # Remove Downloads folder from dock.
        "showAppExposeGestureEnabled" = 1;
        "showDesktopGestureEnabled" = 0;
      };

      # Prevent .DS_Store on network and USB volumes.
      "com.apple.desktopservices" = {
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

      "com.apple.WindowManager" = {
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
