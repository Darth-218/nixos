{
  config,
  pkgs,
  lib,
  zen-browser,
  ollama,
  ...
}:

{
  home.packages = with pkgs; [
    anydesk
    blender
    blueman
    ghostty
    keepassxc
    libnotify
    libreoffice
    librewolf
    localsend
    mako
    mpv
    mysql-workbench
    nomacs
    opencode
    pulseaudio
    putty
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
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    unstable.ollama
    # ollama.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  home.file = {
    ".config/mako" = {
      source = ./mako;
      recursive = true;
    };
    ".config/ghostty" = {
      source = ./ghostty;
      recursive = true;
    };
    ".config/rofi" = {
      source = ./rofi;
      recursive = true;
    };
    ".config/opencode" = {
      source = ./opencode;
      recursive = true;
    };
    ".config/zathura" = {
      source = ./zathura;
      recursive = true;
    };
  };
}
