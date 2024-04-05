### Installation

1. [Initialize](https://wiki.archlinux.org/title/SSH_keys) SSH key

2. Add SSH key to GitHub

3. Install git and clone this repo
```
  pacman -S git
  git config --global user.name "Takumi Ito"
  git config --global user.email ito.tkmi@gmail.com
  git clone https://github.com/gitkumi/config.git
```

4. Install [yay](https://github.com/Jguer/yay)
      
5. Run installation scripts
```
~/install_packages.sh && ~/install_packages_aur.sh && ~/restore.sh 
```

Note: Installing may fail if one of the package names gets changed.  
Check Arch/AUR and manually update the name in `Packages` or `Packages.aur`

6. Add device to [Tailscale](https://tailscale.com/) network

7. Install asdf plugins (nodejs, elixir, erlang, and go) via [asdf-vm](https://asdf-vm.com/#/)

### Adding a new config

- Include the new config in `back_up.sh`
- Update `README.md`

### Saving config

Run `back_up.sh`

### Restoring config

Run `restore.sh`

### TODO

- Setup cron to automatically run `back_up.sh`
