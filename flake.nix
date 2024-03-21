{

  outputs =
    { self
    , nixpkgs
    , nix-darwin
    , home-manager
    , rust-overlay
    }@inputs:
    let

      # Default home-manager config
      home-config = rec {
        username = "gecko";
        homeDirectory = "/home/${username}";
      };

      # Host specific configuration
      hosts = {

        # Work laptop
        gecko-mac = {

          # nixpkgs system
          system = "aarch64-darwin";

          # feature modules
          features = [
            "apps"
            "develop"
          ];

          # home-manager user config
          home-config = rec {
            username = "gecko";
            homeDirectory = "/Users/${username}";
          };
        };
      };

      # Generate home configuration
      homeConfig = host: config: home-manager.lib.homeManagerConfiguration {

        # Configure nixpkgs
        pkgs = import nixpkgs {
          system = config.system;
          config.allowUnfree = true;
          overlays = [
            (import inputs.rust-overlay)
          ];
        };

        # Load features modules
        modules = map (feat: ./features/${feat}) (
          [ "minimal" ] ++ config.features or [ ]
        );

        # Give inputs as extraSpecialArgs
        extraSpecialArgs = inputs // {
          home-config = home-config // config.home-config;
        };
      };

      # Generate darwin configuration
      darwinConfig = host: config: nix-darwin.lib.darwinSystem {

        # Load host specific modules
        modules = [
          { nixpkgs.hostPlatform = config.system; }
          ./darwin
          ./hosts/${host}
        ];

        # Give inputs as specialArgs
        specialArgs = inputs;
      };
    in
    {

      # nix-darwin's configuration
      darwinConfigurations =
        nixpkgs.lib.mapAttrs
          darwinConfig
          hosts;

      # home-manager's configurations
      homeConfigurations =
        nixpkgs.lib.mapAttrs
          homeConfig
          hosts;
    };

  inputs = {

    # nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # nix-darwin
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Rust overlay
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
}
