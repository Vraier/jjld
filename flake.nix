{
  description = "C++ development environment for linker project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    elfio-src = {
      url = "github:serge1/ELFIO/Release_3.12";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    elfio-src,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};

        # include elfIO because nixpkgs is outdated at 3.10
        elfio-3-12 = pkgs.stdenv.mkDerivation {
          pname = "elfio";
          version = "3.12";
          src = elfio-src;

          installPhase = ''
            mkdir -p $out/include
            cp -r elfio $out/include/
          '';
        };
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            gcc
            binutils
            gnumake
            cmake
            ninja
            gdb
            clang-tools
          ];

          buildInputs = [
            elfio-3-12
          ];

          CMAKE_EXPORT_COMPILE_COMMANDS = 1;
          CMAKE_GENERATOR = "Ninja";
        };
      }
    );
}
