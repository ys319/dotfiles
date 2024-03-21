{

  imports = [ ];

  # Empty
  environment.systemPackages = [ ];

  # Configure host
  networking = rec {
    hostName = "gecko-mac";
    computerName = hostName;
    localHostName = hostName;
  };
}
