{
  description = "Devshell for MySQL.";

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
        mysql84
      ];

      # Shell hooks.
      shellHook = ''
        echo "Entering the development environment!"
        mysql --version

        trap 'echo "Leaving the development environment!"' EXIT
      '';
    };
  };
}
