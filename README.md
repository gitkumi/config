### Overview

This repo stores machine-specific dotfiles and package manifests.

Each device lives in a directory named after its `hostname` and can contain:

- `dotfiles/` for files copied into `~/`
- `dotconfig/` for files copied into `~/.config`
- `Packages` for OS packages installed by `install_package.sh`
- `Packages.aur` for Arch AUR packages installed by `install_package_aur.sh`

The scripts in this repo use the current machine's `hostname` to select the matching device directory.

See the OS-specific setup guides for installation and restore steps:

- [Arch Linux](./README_ARCH.md)
- [Ubuntu](./README_UBUNTU.md)
