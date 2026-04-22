{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.kmonad = {
    enable = true;
    keyboards = {
      laptop-kb = {
        device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
        config = lib.readFile ./kbds/config.kbd;
      };
      wired-kb = {
        device = "/dev/input/by-id/usb-EVISION_USB-STDHID_2020-12-15-event-kbd";
        config = lib.readFile ./kbds/wired-config.kbd;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    kmonad
  ];
}

