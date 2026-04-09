{
  description = "OpenClaw local";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-openclaw.url = "github:openclaw/nix-openclaw";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-openclaw,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nix-openclaw.overlays.default ];
      };
    in
    {
      homeConfigurations."darth" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          nix-openclaw.homeManagerModules.openclaw
          {
            home.username = "darth";
            home.homeDirectory = "/home/darth";
            home.stateVersion = "24.11";
            programs.home-manager.enable = true;

            programs.openclaw = {
              documents = ./documents;
              bundledPlugins = {
                bird.enable = false;
              };
              toolNames = [
                "nodejs_22"
                "pnpm_10"
                "git"
                "curl"
                "jq"
                "python3"
                "ripgrep"
              ];

              config = {
                env = {
                  vars = {
                    ANTHROPIC_API_KEY_FILE = "/home/darth/.secrets/anthropic-api-key";
                  };
                };
                gateway = {
                  mode = "local";
                  auth = {
                    token = "605618dafe2de030c7f942fe6850a75cd9a53605a4cd36dc0ec8b647d733ea27";
                  };
                };

                agents = {
                  defaults = {
                    model = "ollama/llama3.2:1b";
                  };
                };

                channels.telegram = {
                  tokenFile = "/home/darth/.secrets/telegram-bot-token";
                  allowFrom = [ 5050373651 ];
                  groups = {
                    "*" = {
                      requireMention = true;
                    };
                  };
                };
              };

              instances.default = {
                enable = true;
                plugins = [
                ];
              };
            };
          }
        ];
      };
    };
}

