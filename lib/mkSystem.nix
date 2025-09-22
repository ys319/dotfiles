{ nixpkgs, nix-darwin, ... }@inputs:

let

  # Define builders
  systemBuilders = {

    # NixOS builder
    nixos = {
      builder = nixpkgs.lib.nixosSystem;
      defaultSystem = "x86_64-linux";
      baseModule = { system, hostName }: {
        nixpkgs.hostPlatform = system;
        networking.hostName = hostName;
      };
    };

    # Darwin builder
    darwin = {
      builder = nix-darwin.lib.darwinSystem;
      defaultSystem = "aarch64-darwin";
      baseModule = { system, hostName }: {
        nixpkgs.hostPlatform = system;
        networking = {
          inherit hostName;
          computerName = hostName;
          localHostName = hostName;
        };
      };
    };
  };
in

type:

let

  # Select builder from type
  config = systemBuilders.${type};
in

hostName: hostConfig: config.builder rec {

  system = hostConfig.system or config.defaultSystem;

  modules = [
    (config.baseModule { inherit system hostName; })
    {
      nixpkgs.config.allowUnfree = true;
    }
    ../hosts/${hostName}
  ];

  specialArgs = inputs;
}
