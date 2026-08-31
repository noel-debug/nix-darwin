{
  description = "Nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    # macOS system manager
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }: {
    darwinConfigurations."Noels-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/shared-packages.nix
        ./hosts/macbook-air
      ];
    };
  };
}
