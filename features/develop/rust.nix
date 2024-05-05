{ pkgs, ... }: {

  home = {
    sessionPath = [ "$HOME/.cargo/bin" ];

    packages = with pkgs;[
      (rust-bin.stable.latest.default.override {
        extensions = [
          "rust-src"
          "clippy"
          "rust-analyzer"
        ];
        targets = [
          "wasm32-unknown-unknown"
          "wasm32-wasi"
        ];
      })
    ];
  };
}
