{ home-manager
, nix-darwin
, nixpkgs
, rust-overlay
, ...
}@inputs:
let
  profile = import ../profile.nix;
in
{

  # Generate home configuration
  homeConfig = host: config: home-manager.lib.homeManagerConfiguration {

    # Configure nixpkgs
    pkgs = import nixpkgs {
      system = config.system;
      config.allowUnfree = true;
      overlays = [
        (import rust-overlay)
      ];
    };

    # Load features modules
    modules = map (feat: ../home/${feat}) (
      [ "minimal" ] ++ config.features or [ ]
    );

    # Give inputs as extraSpecialArgs
    extraSpecialArgs = inputs // {
      profile = profile // config.profile;
    };
  };

  # Generate darwin configuration
  darwinConfig = host: config: nix-darwin.lib.darwinSystem {

    # Load host specific modules
    modules = [
      { nixpkgs.hostPlatform = config.system; }
      ../darwin
      ../hosts/${host}
    ];

    # Give inputs as specialArgs
    specialArgs = inputs;
  };
}
