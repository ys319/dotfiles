{ rust-overlay, ... }:

{
  nixpkgs = {
    overlays = [
      rust-overlay.overlays.default
    ];

    config = {
      allowUnfree = true;
    };
  };
}
