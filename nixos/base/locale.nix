{ lib, ... }:

{

  # Set default time zone
  time.timeZone = lib.mkDefault "Asia/Tokyo";

  # Set default locale
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";
}
