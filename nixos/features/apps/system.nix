{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    blueman
    keepassxc
    pulseaudio
    libnotify
    localsend
    qbittorrent
    steam-run
  ];
}
