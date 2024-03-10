{
  description = "Spotify2YoutubeMusic - NixFlake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
        flake-utils.lib.eachDefaultSystem (system: let
            pkgs = import nixpkgs { inherit system; };
            python = pkgs.python310;
            pythonPackages = with pkgs.python310Packages; [
                ytmusicapi
                tkinter
            ];
            in {
                devShells.default = pkgs.mkShell {
                    buildInputs = [ python ] ++ pythonPackages;
                };
        });
}
