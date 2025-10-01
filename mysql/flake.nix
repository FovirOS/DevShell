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
        mysql80
        just
      ];

      # Shell hooks.
      shellHook = ''
        echo "Entering the development environment!"
        mysql --version

        echo 'Just Operations:'
        echo '  "just init" -- initialize MySQL.'
        echo '  "just server" -- enter MySQL server.'
        echo '  "just start" -- enter MySQL shell.'

        trap 'mysqladmin -u root --socket ./data/mysql.sock shutdown; echo "Leaving the development environment!"' EXIT
      '';
    };
  };
}
