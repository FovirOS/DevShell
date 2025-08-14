{
  description = "DevShell for React + Vite";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        nodejs
      ];

      shellHook = ''
        export NODE_ENV=development

        if [ ! -d "node_modules/react"]; then
          echo "Installing React..."
          pnpm add react react-dom
        fi

        if ! command -v vite >/dev/null 2>&1; then
          echo "Installing Vite..."
          pnpm add vite
        fi

        echo "Entering the development environment!"
        echo "Node: $(node -v), pnpm: $(pnpm -v)"

        trap 'echo "Leaving the development environment!"' EXIT
      '';
    };
  };
}
