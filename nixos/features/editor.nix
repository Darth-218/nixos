{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.packages = with pkgs; [
    cargo
    fd
    lua-language-server
    nil
    nixpkgs-fmt
    nodejs
    ripgrep
    texlive.combined.scheme-full
    tree-sitter
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Yahia Gaber";
        email = "yahia.hany.gaber@proton.me";
      };

      extraConfig = {
        credential.helper = "store";
        push.default = "current";
        pull.rebase = true;
        rebase.autoStash = true;
        status.branch = true;
        status.showStash = true;
        status.showUntrackedFiles = "all";
        advice.statusHints = false;
        core.whitespace = "error";
        interactive.editor = "nvim";
        interactive.singleKey = true;
      };
    };
  };

  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}