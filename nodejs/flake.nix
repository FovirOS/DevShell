{
  description = "DevShell with Node.js.";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          # nodejs
          # nodejs_20
        ];

        shellHook = ''
          export NODE_ENV=development

          echo "Entering the development environment!"
          echo "Node: $(node -v), pnpm: $(pnpm -v)"

          trap 'echo "Leaving the development environment!"' EXIT
        '';
      };
    };
}
