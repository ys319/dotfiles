{

  # Nvidia 32bit driver
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Nvidia driver
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
  };

  # Containers
  virtualisation.docker.enableNvidia = true;
  virtualisation.podman.enableNvidia = true;
}
