{ darwin, ... }:

{
  imports = [

    # Monolithic module.
    darwin.base.default
  ];

  # Old Nix installer uses GID 30000 instead of new default 350
  ids.gids.nixbld = 30000;
}
