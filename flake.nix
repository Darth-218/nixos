{
  description = "NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ollama.url = "github:abysssol/ollama-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      zen-browser,
      ollama,
      ...
    }:
    let
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations.deathstar = lib.nixosSystem {
        specialArgs = { inherit zen-browser ollama; };
        modules = [
          ./nixos/base/default.nix
          ./nixos/features/keyboard.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit zen-browser ollama; };
              users.darth = {
                imports = [
                  ./nixos/features/shell.nix
                  ./nixos/features/editor.nix
                  ./nixos/features/desktop.nix
                  ./nixos/features/wm.nix
                  ./nixos/features/services.nix
                ];
                home.stateVersion = "25.11";
                home.username = "darth";
                home.homeDirectory = "/home/darth";
              };
            };
          }
        ];
      };
    };
}
