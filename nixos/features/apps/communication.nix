{
  config,
  pkgs,
  lib,
  zen-browser,
  ...
}:

{
  home.packages = with pkgs; [
    thunderbird
    vesktop
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
