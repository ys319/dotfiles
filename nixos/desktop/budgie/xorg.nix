{

  # Configure keymap in X11
  services.xserver = {

    # Enable the X11 windowing system.
    enable = true;

    # Display manager for Budgie.
    displayManager.lightdm.enable = true;

    # Keyboard Layout
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable the Budgie Desktop environment.
  services.desktopManager.budgie.enable = true;

  # Mouse and Touchpad
  services.libinput.mouse = {

    # Disable touchpad when typing.
    disableWhileTyping = true;
  };
}
