{
  config,
  pkgs,
  lib,
  zen-browser,
  unstable,
  pi-mono,
  ...
}:

let
  zennotes = pkgs.callPackage ./zennotes.nix { };
in

{
  home.packages = with pkgs; [
    android-studio
    zennotes
    blender
    blueman
    freecad
    ghostty
    gimp
    keepassxc
    libnotify
    libreoffice
    localsend
    mako
    mpv
    mysql-workbench
    nomacs
    opencode
    pulseaudio
    putty
    rofi
    qbittorrent
    swaybg
    swaylock
    syncplay
    shotcut
    thunderbird
    tuxguitar
    vesktop
    vlc
    vscodium
    wmenu
    xwayland-satellite
    zathura
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    zed-editor-fhs
    openjdk21
    steam-run
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
