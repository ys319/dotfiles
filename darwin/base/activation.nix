{ config, ... }:

let
  user = config.system.primaryUser;
in
{
  # Settings that require currentHost domain or nested dict manipulation,
  # which system.defaults / CustomUserPreferences cannot handle correctly.
  system.activationScripts.postActivation.text = ''
    # Keyboard modifier mapping (CapsLock <-> Control, Globe/Fn <-> Control)
    sudo -u ${user} defaults -currentHost write -g "com.apple.keyboard.modifiermapping.0-0-0" -array \
      '<dict>
        <key>HIDKeyboardModifierMappingSrc</key><integer>30064771299</integer>
        <key>HIDKeyboardModifierMappingDst</key><integer>1095216660483</integer>
      </dict>' \
      '<dict>
        <key>HIDKeyboardModifierMappingSrc</key><integer>1095216660483</integer>
        <key>HIDKeyboardModifierMappingDst</key><integer>30064771303</integer>
      </dict>' \
      '<dict>
        <key>HIDKeyboardModifierMappingSrc</key><integer>280379760050179</integer>
        <key>HIDKeyboardModifierMappingDst</key><integer>30064771299</integer>
      </dict>' \
      '<dict>
        <key>HIDKeyboardModifierMappingSrc</key><integer>30064771303</integer>
        <key>HIDKeyboardModifierMappingDst</key><integer>1095216660483</integer>
      </dict>'

    # Disable input source switching shortcuts (Ctrl+Space / Ctrl+Alt+Space).
    # Use -dict-add to avoid overwriting other existing hotkeys.
    sudo -u ${user} defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "60" \
      '<dict>
        <key>enabled</key><false/>
        <key>value</key>
        <dict>
          <key>parameters</key>
          <array>
            <integer>32</integer>
            <integer>49</integer>
            <integer>1048576</integer>
          </array>
          <key>type</key><string>standard</string>
        </dict>
      </dict>'
    sudo -u ${user} defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "61" \
      '<dict>
        <key>enabled</key><false/>
        <key>value</key>
        <dict>
          <key>parameters</key>
          <array>
            <integer>32</integer>
            <integer>49</integer>
            <integer>1572864</integer>
          </array>
          <key>type</key><string>standard</string>
        </dict>
      </dict>'

    # Disable Handoff
    sudo -u ${user} defaults -currentHost write com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool false
    sudo -u ${user} defaults -currentHost write com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool false

    # Disable Universal Control
    sudo -u ${user} defaults -currentHost write com.apple.universalcontrol Disable -bool true
    sudo -u ${user} defaults -currentHost write com.apple.universalcontrol DisableMagicEdges -bool true
  '';
}
