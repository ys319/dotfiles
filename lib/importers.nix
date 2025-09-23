{ lib, ... }:

let
  # ディレクトリを再帰的にスキャンし、ネストした属性セットを構築する関数
  importer = dir:
    lib.mapAttrs'
      (name: type:
        let
          path = dir + "/${name}";
        in
        if type == "directory" then
        # ディレクトリの場合、再帰的にimporterを呼び出す
          lib.nameValuePair name (importer path)
        else if type == "regular" && lib.hasSuffix ".nix" name then
        # .nixファイルの場合、ファイル名から拡張子を除いたものをキーとして、インポートしたモジュールを値とする
        # (例: "foo.nix" -> name="foo")
          lib.nameValuePair (lib.removeSuffix ".nix" name) (import path)
        else
        # それ以外は無視する
          lib.nameValuePair "" null
      )
      (builtins.readDir dir);
in

dir: importer dir
