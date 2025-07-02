{ config, ... }: {

  # Enable graphics
  hardware.graphics.enable = true;

  # Nvidia 32bit driver
  hardware.opengl = {
    enable = true;
    # driSupport = true;
    driSupport32Bit = true;
  };

  # Nvidia driver
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Containers
  virtualisation.docker.enableNvidia = true;
  virtualisation.podman.enableNvidia = true;
  hardware.nvidia-container-toolkit.enable = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];
}
