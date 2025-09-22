{ home-manager, nixpkgs, rust-overlay, ... }@inputs:

host: hostConfig:

let
  features = [ "base" ] ++ hostConfig.features or [ ];
in

home-manager.lib.homeManagerConfiguration {

  pkgs = import nixpkgs {
    system = hostConfig.system;
    config.allowUnfree = true;
    overlays = [
      (import rust-overlay)
    ];
  };

  modules = map (feat: ../home/${feat}) features;

  extraSpecialArgs = inputs;
}
