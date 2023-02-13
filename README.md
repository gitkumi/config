```
├── back_up.sh
├── dotconfig
│   ├── alacritty
│   ├── cava
│   ├── nvim
│   ├── tmuxinator
│   ├── user-dirs.dirs
│   └── xfce4
├── dotfiles
├── install_package_aur.sh
├── install_package.sh
├── Packages
├── Packages.aur
├── README.md
├── restore.sh
└── scripts
    ├── git_checkout.sh
    └── git_commit.sh
```

### Installation

1. Manual tasks
    - Setup device SSH key
    - Install [yay](https://github.com/Jguer/yay)
    - Install [git](https://wiki.archlinux.org/title/git) and clone this repo
      ```
      pacman -S git && cd ~ && git clone git@github.com:gitkumi/config.git
      ```
      
2. Run installation scripts  
      ```
      cd ~/config && ./install_packages.sh && ./install_packages_aur.sh && restore.sh 
      ```

    Installing may fail if one of the package names gets changed.  
    Check Arch/AUR and manually update the name in `Packages` or `Packages.aur`

3. Manual tasks that can be deferred
    - Add device to [Tailscale](https://tailscale.com/) network
    - Install [z](https://github.com/rupa/z)
    - Install asdf plugins (nodejs, elixir, and erlang, go) via [asdf-vm](https://asdf-vm.com/#/)
    - Setup VS Code Settings Sync and provide this [gist](https://gist.github.com/gitkumi/c25479bdc423fe539611e3c0e281fd8d) 

### Adding a new config

- Include the new config in `back_up.sh`
- Update `README.md`

### Saving config

Run `back_up.sh`

### Restoring config

Run `restore.sh`

### TODO

- Setup cron to automatically run `back_up.sh`
