{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    tmux
    zoxide
    fzf
    glow
    btop
    gcc
    go
    gh
    python315
    unzip
    lazygit
    nerd-fonts.jetbrains-mono
    mysql84
    mysql-workbench
  ];

  home.file = {
    ".bashrc".source = ./bashrc/.bashrc;
    ".config/tmux".source = ./tmux;
  };
}