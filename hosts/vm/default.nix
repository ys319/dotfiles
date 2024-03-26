{

  imports = [ ];

  # Empty
  environment.systemPackages = [ ];

  # Configure host
  networking = rec {
    hostName = "vm";
    computerName = hostName;
    localHostName = hostName;
  };

  system.defaults.dock.orientation = "left";
}
