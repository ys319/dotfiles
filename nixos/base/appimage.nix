{ pkgs, ... }:

{

  # Register AppImage
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = lib.mkDefault false;
    interpreter = lib.mkDefault "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = lib.mkDefault "magic";
    offset = lib.mkDefault 0;
    mask = lib.mkDefault ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = lib.mkDefault ''\x7fELF....AI\x02'';
  };
}
