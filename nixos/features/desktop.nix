{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    blender
    ghostty
    blueman
    keepassxc
    libnotify
    libreoffice
    librewolf
    localsend
    mako
    mpv
    nomacs
    pulseaudio
    rofi
    scrcpy
    swaybg
    swaylock
    syncplay
    tuxguitar
    vesktop
    vlc
    wmenu
    xwayland-satellite
    zathura
    ollama
    opencode
  ];

  home.file = {
    ".config/mako" = { source = ./mako; recursive = true; };
    ".config/ghostty" = { source = ./ghostty; recursive = true; };
    ".config/rofi" = { source = ./rofi; recursive = true; };
    ".config/opencode" = { source = ./opencode; recursive = true; };
    ".config/zathura" = { source = ./zathura; recursive = true; };
  };
}