{ darwin, ... }:

{
  imports = [

    # Monolithic module.
    darwin.base.default
  ];

  # New Nix installer uses GID 350 instead of legacy 30000
  ids.gids.nixbld = 350;
}
