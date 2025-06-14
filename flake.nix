{
  description = "A bash project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    devShells."x86_64-linux".default = nixpkgs.legacyPackages."x86_64-linux".mkShell {
        packages = with nixpkgs.legacyPackages."x86_64-linux"; [
          entr
          bats
          just
        ];
      };
      packages.x86_64-linux.default = import ./default.nix {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      };
  };
}
