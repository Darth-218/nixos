{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    blender
    freecad
    gimp
    shotcut
    tuxguitar
  ];
}
