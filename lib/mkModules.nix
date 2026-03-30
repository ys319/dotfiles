{ lib, ... }:

let
  # ディレクトリを再帰的にスキャンし、ネストした属性セットを構築する関数
  listModules = dir:
    let
      entries = builtins.readDir dir;
      # .nixファイルとディレクトリのみを対象にする
      validEntries = lib.filterAttrs
        (name: type: type == "directory" || (type == "regular" && lib.hasSuffix ".nix" name))
        entries;
    in
    lib.mapAttrs'
      (name: type:
        let
          path = dir + "/${name}";
        in
        if type == "directory" then
        # ディレクトリの場合、再帰的にlistModulesを呼び出す
          lib.nameValuePair name (listModules path)
        else
        # .nixファイルの場合、ファイル名から拡張子を除いたものをキーとして、インポートしたモジュールを値とする
        # (例: "foo.nix" -> name="foo")
          lib.nameValuePair (lib.removeSuffix ".nix" name) (import path)
      )
      validEntries;
in

dir: listModules dir
