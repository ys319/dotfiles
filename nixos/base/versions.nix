{ self, ... }:

{

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Don't change.
  system.stateVersion = "23.11";
}
