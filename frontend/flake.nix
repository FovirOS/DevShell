{
  description = "DevShell for front end.";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.${system}.default = pkgs.mkShell {
      shellHook = ''
        echo "Entering the development environment!"

        trap 'echo "Leaving the development environment!"' EXIT
      '';
    };
  };
}
