### Installation

1. [Initialize](https://wiki.archlinux.org/title/SSH_keys) ssh key and [setup](https://github.com/White-Oak/arch-setup-for-dummies/blob/master/setting-up-ssh-agent.md) SSH agent

2. Add ssh key to homelab and GitHub

3. Install [yay](https://github.com/Jguer/yay)

4. Install git and clone this repo
```
  pacman -S git
  git config --global user.name "Takumi Ito"
  git config --global user.email ito.tkmi@gmail.com
  git clone https://github.com/gitkumi/config.git ~
```

5. Run installation scripts
```
~/config/install_packages.sh 
~/config/install_packages_aur.sh
~/config/restore.sh 
```

Note: Installation may fail if one of the package names gets changed.  
Check Arch/AUR and manually update the name in `Packages` or `Packages.aur`

6. Install [Tailscale](https://tailscale.com/) and add the device to network

7. Install [asdf](https://asdf-vm.com/#/) and the following plugins:
- Node
- Go
- Elixir
- Erlang

8. (Arch Linux installation final boss) Check if [audio](https://wiki.archlinux.org/title/sound_system) is working (it's not) 

Note: Install `pipewire` and it's related packages then run `wpctl status`. If Audio Sinks/Source is null, the required firmwares are not installed.  
 
### Adding a new config

- Include the new config in `back_up.sh`
- Update `README.md`

### Saving config

- Run `back_up.sh`

### Restoring config

- Run `restore.sh`
