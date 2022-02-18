# NixOS Desktop Config

## Installation

1. [Install NixOS](https://nixos.org/manual/nixos/stable/index.html#ch-installation)
1. Set up [git](https://nixos.wiki/wiki/Git) for your installation
1. Clone this repository
1. Remove your config: `sudo rm /etc/nixos/configuration.nix` (or rename it to keep a backup)
1. Symlink the new config: `sudo ln -s ~/Workspace/nixos-config/configuration.nix /etc/nixos/configuration.nix`
1. Copy hardware config to repo: `sudo cp /etc/nixos/hardware-configuration.nix hardware-configuration.nix`
1. Run `sudo nixos-rebuild switch`
