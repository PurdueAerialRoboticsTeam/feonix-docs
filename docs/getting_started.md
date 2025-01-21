# Getting Started

## Cloning the repository

*For Windows users, use WSL for the following instructions.* If you don't have
WSL, you can follow the instructions
[here](https://learn.microsoft.com/en-us/windows/wsl/install) to install it.

Send your GitHub username to the team lead, and they will add you to the
repository. Then, ensure you have git installed. If not, install it from
[here](https://git-scm.com/downloads).

To be able to clone the repository, you will have to setup SSH keys:

```bash
ssh-keygen # Hit enter on all prompts
```

Retrieve the public key:

```bash
cat ~/.ssh/id_rsa.pub
```

Add this public key to your GitHub account. Instructions can be found
[here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

Now you are ready to clone the repository:

```bash
git clone git@github.com:PurdueAerialRoboticsTeam/feonix.git
```

## Recommended VSCode Extensions

- [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml)
- [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)
- [Dependi](https://marketplace.visualstudio.com/items?itemName=fill-labs.dependi)
- [Rust Test Explorer](https://marketplace.visualstudio.com/items?itemName=swellaby.vscode-rust-test-adapter)

## Methods

There are three methods to set up the repository:

1. [Using Nix](#using-nix) (recommended)
2. [Using Devcontainers](#using-devcontainers) (quickest but has some limitations)
3. [Manually](#manually) (not recommended)

## Using Nix

### Nix Prerequisites

- A Unix-like operating system (Linux, macOS, etc.), or
[WSL](https://learn.microsoft.com/en-us/windows/wsl/install) on Windows.
- [Nix](https://nixos.org/download.html)
- [direnv](https://direnv.net/) (optional, but recommended)

#### Additional VSCode Extensions

- [Nix Extension Pack](https://marketplace.visualstudio.com/items?itemName=pinage404.nix-extension-pack)

### Nix Setup

To setup the repository you will need to enable Nix Flakes. This can be done by
running the following commands:

```bash
# Enable Nix Flakes
mkdir -p /etc/nix
echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
```

Now enter the repository and enter the development environment:

```bash
cd feonix # or the directory where you cloned the repository

# Enter the nix shell (if using direnv, this will be done automatically):
nix develop
```

## Using Devcontainers

### Devcontainers Prerequisites

1. Install [Docker](https://docs.docker.com/get-docker/). On Windows, you will
need to install WSL first. Instructions can be found
[here](https://learn.microsoft.com/en-us/windows/wsl/install).

2. Install [Visual Studio Code](https://code.visualstudio.com/) and the
[Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

### Devcontainers Setup

1. Open the repository in Visual Studio Code.
2. Press `F1` (Open Command Palette) and select
`Dev Containers: Rebuild and Reopen in Container`.

## Manually

I'll add instructions here later.

Note: This is a work in progress. If you want to help, please contact the team lead.
