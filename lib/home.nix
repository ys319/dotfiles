{ pkgs, home-manager, ... }:

host: hostConfig: home-manager.lib.homeManagerConfiguration

rec {

  # Load features modules
  modules = map (feat: ../home/${feat}) (
    [ "minimal" ] ++ hostConfig.features or [ ]
  );

  home = {
    username = hostConfig.username;
    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${home.username}"
      else "/home/${home.username}";
  };
}
