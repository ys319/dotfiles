{ pkgs, ... }: {

  home = {
    sessionPath = [ "$HOME/.cargo/bin" ];

    packages = with pkgs;[
      (rust-bin.stable.latest.default.override {
        targets = [ "wasm32-unknown-unknown" "wasm32-wasi" ];
      })
    ];
  };
}
