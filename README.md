# Feonix Documentation

Deployed at [purdueaerialroboticsteam.github.io/feonix-docs/](https://purdueaerialroboticsteam.github.io/feonix-docs/)

Based off [mkdocs-plantuml-c4](https://github.com/tfc/mkdocs-plantuml-c4/tree/main)

## Usage

To update the Rust documentation, run the "Update Rust API Docs" workflow in the actions page.

Deploy offline without installing or cloning anything:
```sh
nix run github:PurdueAerialRoboticsTeam/feonix-docs
```

If you use ssh keys, please use
`git+ssh://git@github.com/PurdueAerialRoboticsTeam/feonix-docs` instead.

Deploy offline with checked-out version:
```sh
git clone https://github.com/PurdueAerialRoboticsTeam/feonix-docs.git
cd feonix-docs
nix develop
mkdocs serve
```

Build pdf:
```sh
# without local checkout
nix build github:PurdueAerialRoboticsTeam/feonix-docs#pdf

# local checkout
nix build .#pdf
```
