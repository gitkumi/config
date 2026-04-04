### Ubuntu

### Requirements

- `apt-get`
- `sudo`
- `git`

### Restore

Run:

```bash
~/config/install_package.sh
~/config/install_package_aur.sh
~/config/restore.sh
```

Behavior on Ubuntu:

- `install_package.sh` installs packages from `<hostname>/Packages` with `apt-get`
- `install_package_aur.sh` skips, since AUR is Arch-specific

If a package name has changed, update the device's `Packages` file.

### Package backup

`back_up.sh` saves manually installed Ubuntu packages with:

```bash
apt-mark showmanual
```

### Optional follow-up

- Install [Tailscale](https://tailscale.com/) and add the device to the network
- Install [asdf](https://asdf-vm.com/#/) and the plugins you need
