{ pkgs, ... }:

{
  users.users.gecko = {
    # Zsh with starship.
    shell = pkgs.zsh;

    # Create as real user.
    isNormalUser = true;

    # Join group.
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "docker"
      "dialout" # Allow access serial port
    ];

    # Public key.
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDq8ogS8+SyuRI3DlbEMr4lK287IYlXcEf5ZKLMJkhf0"
    ];
  };
}
