{ config, ... }: {

  # Enable graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Nvidia driver
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Containers
  hardware.nvidia-container-toolkit.enable = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [
    "nvidia"
  ];
}
