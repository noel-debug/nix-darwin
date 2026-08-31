{
  description = "Nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    # macOS system manager
    nix-darwing = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }: {
    darwinConfigurations."Noels-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/shared-packages.nix
        ./hosts/macbook-air
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.noel = ./home/noel;
          };
        }
      ];
    };
  };
}
