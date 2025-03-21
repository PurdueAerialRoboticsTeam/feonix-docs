# Feonix Documentation

Based off of [mkdocs-plantuml-c4](https://github.com/tfc/mkdocs-plantuml-c4/tree/main)

This repository provides a nix flake that builds and serves an the feonix
project documentation that is written in markdown and generated as HTML
by the mkdocs tool. It bundles multiple plugins in a handy way so you don't
have to do this yourself for every computer you use it on.

## Usage

To view the generated config offline without installing or cloning anything,
run:

```sh
nix run github:PurdueAerialRoboticsTeam/feonix-docs
```

If you use ssh keys, please use `git+ssh://git@github.com/PurdueAerialRoboticsTeam/feonix-docs` instead.

To view the checked-out version, clone the repository and from inside, run:

```sh
nix develop
mkdocs serve
```

You can also build a PDF version of the docs:

```sh
# without local checkout
nix build github:PurdueAerialRoboticsTeam/feonix-docs#pdf

# local checkout
nix build .#pdf
```

## Packaged Tools/Plugins

- [mkdocs](https://www.mkdocs.org/)
- [mkdocs-material](https://squidfunk.github.io/mkdocs-material/)
- [mkdocs-with-pdf](https://github.com/orzih/mkdocs-with-pdf)
- [plantuml](https://plantuml.com/)
- [plantuml-markdown](https://github.com/mikitex70/plantuml-markdown)
- [C4-plantuml](https://github.com/plantuml-stdlib/C4-PlantUML)
- [plantuml-icon-font-sprites](https://github.com//tupadr3/plantuml-icon-font-sprites)
