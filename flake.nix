{
  description = "Feonix Documentation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, pre-commit-hooks, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        python3Packages = (pkgs.python3.override {
          packageOverrides = pFinal: pPrev: {
            mkdocs-with-pdf = pFinal.callPackage ./mkdocs-with-pdf.nix { };
            plantuml-markdown = pPrev.plantuml-markdown.override {
              plantuml = pkgs.plantuml-c4;
            };
          };
        }).pkgs;
      in
      rec {
        packages = {
          html = python3Packages.callPackage ./build.nix { };
          pdf = packages.html.overrideAttrs (old: {
            name = "feonix-documentation.pdf";
            ENABLE_PDF_EXPORT = "true";
            buildPhase = ''
              mkdocs build
              cp site/pdf/document.pdf $out
            '';
          });
          default = packages.html;
        };

        apps = {
          serve-docs = {
            type = "app";
            program = builtins.toString (pkgs.writeShellScript "serve-docs" ''
              exec ${pkgs.python3}/bin/python3 -m http.server \
              --bind 127.0.0.1 \
              --directory ${packages.html}
            '');
          };
          serve-dev = {
            type = "app";
            program = builtins.toString (pkgs.writeShellScript "serve-dev" ''
              echo To start a live reload server, run  $ mkdocs serve
            '');
          };
          default = apps.serve-docs;
        };

        checks = {
          pre-commit-check = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              cspell = {
                enable = true;
                entry = "${pkgs.nodePackages.cspell}/bin/cspell --words-only";
                types = [ "markdown" ];
              };
              markdownlint.enable = true;
              nixpkgs-fmt.enable = true;
              statix.enable = true;
            };
          };
        };

        devShell = with pkgs; mkShell {
          inputsFrom = [ packages.html ];
          shellHook = ''
            ${checks.pre-commit-check.shellHook}
          '';
        };
      }
    );
}
