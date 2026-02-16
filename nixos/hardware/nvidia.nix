{ config, lib, ... }: {

  # Enable graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Nvidia driver
  hardware.nvidia = {
    open = lib.mkDefault false;
    modesetting.enable = lib.mkDefault true;
    powerManagement.enable = lib.mkDefault true;
    powerManagement.finegrained = lib.mkDefault false;
    nvidiaSettings = lib.mkDefault true;
    package = lib.mkDefault config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Containers
  hardware.nvidia-container-toolkit.enable = lib.mkDefault true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = lib.mkDefault [
    "nvidia"
  ];
}
