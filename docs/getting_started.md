# Getting Started

## Prerequisites

Download the following tools:

- [Rust](https://www.rust-lang.org/tools/install)
- [Git](https://git-scm.com/downloads)
- [Docker](https://docs.docker.com/get-docker/)
- [VSCode](https://code.visualstudio.com/download)
(Recommended, but you can choose to use your own editor instead)

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
