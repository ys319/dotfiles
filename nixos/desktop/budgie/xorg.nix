{

  # Configure keymap in X11
  services.xserver = {

    # Enable the X11 windowing system.
    enable = true;

    # Enable the Budgie Desktop environment.
    displayManager.lightdm.enable = true;
    desktopManager.budgie.enable = true;

    # Keyboard Layout
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Mouse and Touchpad
  services.libinput.mouse = {

    # Disable touchpad when typing.
    disableWhileTyping = true;
  };
}
