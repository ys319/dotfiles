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
      "libvirtd"
    ];

    # Public key.
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDq8ogS8+SyuRI3DlbEMr4lK287IYlXcEf5ZKLMJkhf0 @x270"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK7Fs1XAaKOO9yG4woffvFFB7FzFQQjHNO+xTZeNfy90 @m5"
    ];
  };
}
