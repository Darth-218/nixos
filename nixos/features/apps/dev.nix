{
  config,
  pkgs,
  lib,
  ...
}:

let
  zennotes = pkgs.callPackage ../zennotes.nix { };
in

{
  home.packages = with pkgs; [
    android-studio
    vscodium
    zed-editor-fhs
    opencode
    mysql-workbench
    openjdk21
    putty
    zennotes
  ];
}
