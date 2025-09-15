{
  description = "Dev Shell for Zola";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.${system}.default = pkgs.mkShell {
      # Add packages here.
      buildInputs = with pkgs; [
        zola
        nodejs
        just
      ];

      # Shell hooks.
      shellHook = ''
        echo "Entering the development environment!"
        zola --version

        npm install --no-save prettier prettier-plugin-toml prettier-plugin-jinja-template
        trap 'echo "Leaving the development environment!"' EXIT
      '';
    };
  };
}
