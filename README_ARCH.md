### Arch Linux

### Requirements

- `pacman`
- `yay`
- `sudo`
- `git`

### Restore

Run:

```bash
~/config/install_package.sh
~/config/install_package_aur.sh
~/config/restore.sh
```

Behavior on Arch:

- `install_package.sh` installs packages from `<hostname>/Packages` with `pacman`
- `install_package_aur.sh` installs packages from `<hostname>/Packages.aur` with `yay`

If a package name has changed, update the device's `Packages` or `Packages.aur` file.

### Optional follow-up

- Install [Tailscale](https://tailscale.com/) and add the device to the network
- Install [asdf](https://asdf-vm.com/#/) and the plugins you need
- Verify audio is working (it's not)

For audio troubleshooting, install `pipewire` and related packages, then run `wpctl status`. If Audio Sinks/Source is null, required firmware may be missing.
