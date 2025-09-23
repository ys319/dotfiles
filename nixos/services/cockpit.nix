{

  services.cockpit = {
    enable = true;
    openFirewall = true;
  };

  virtualisation.libvirtd = {
    enable = true;
  };
}
