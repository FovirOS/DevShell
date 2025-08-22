{
  description = "DevShell for TypeScript";

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

        ensure_npm_package() {
           local pkg=$1

          if npm list --depth=0 | grep "$pkg" &>/dev/null; then
            echo "$pkg installed"
          else
            echo "Installing $pkg..."
            npm add "$pkg"
          fi
        }

        ensure_npm_package tsx

        echo "Entering the development environment!"
        echo "Node: $(node -v), npx: $(npx -v)"

        trap 'echo "Leaving the development environment!"' EXIT
      '';
    };
  };
}
