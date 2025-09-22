{ inputs, ... }:

{
  nixpkgs = {
    overlays = [
      # `inputs`の中から`rust-overlay`にアクセスする
      inputs.rust-overlay.overlays.default
    ];

    config = {
      allowUnfree = true;
    };
  };
}
