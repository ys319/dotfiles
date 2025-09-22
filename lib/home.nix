{ home-manager, nixpkgs, rust-overlay, ... }@inputs:

host: hostConfig:

let
  nixpkgsConfig = (import ../common/nixpkgs.nix) { inherit inputs; };

  pkgs = import nixpkgs ({
    system = hostConfig.system;
    config.allowUnfree = true;
    overlays = [
      (import rust-overlay)
    ];
  } // nixpkgsConfig);

in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  extraSpecialArgs = {
    inherit inputs;
  };

  modules = (map (feat: ../home/${feat}) (
    [ "minimal" ] ++ hostConfig.features or [ ]
  ));

  # home.username = hostConfig.username;
}
