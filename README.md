```
├── back_up.sh
├── dotconfig (Files stored on ~/.config)
│   ├── cava
│   ├── nvim
│   ├── tmuxinator
│   ├── user-dirs.dirs
│   └── xfce4
├── dotfiles (Files stored on ~)
│   ├── .bash_aliases
│   ├── .bash_profile
│   ├── .bashrc
│   └── .dir_colors
│   └── .tmux.conf
│   └── .tool-versions
│   └── .Xmodmap
│   └── .xprofile
├── install_package_aur.sh
├── install_package.sh
├── Packages
├── Packages.aur
├── README.md
├── restore.sh
└── scripts
```

### Installing (clean machine)
1. Crucial manual installation unhandled by scripts
    - Setup device SSH key
    - Install [yay](https://github.com/Jguer/yay)
    - Install [git](https://wiki.archlinux.org/title/git) and clone this repo
      ```
      pacman -S git && cd ~ && git clone git@github.com:gitkumi/config.git
      ```
      
2. Run the installation scripts  
      ```
      cd ~/config && ./install_packages.sh && ./install_packages_aur.sh && restore.sh 
      ```

    Installing packages may fail sometime. See #Notes

3. Manual installation that can be deferred
    - Add device to [Tailscale](https://tailscale.com/) network
    - Install [z](https://github.com/rupa/z)
    - Install nodejs, elixir, and erlang via [asdf-vm](https://asdf-vm.com/#/)
    - Setup VS Code Settings Sync and provide this [gist](https://gist.github.com/gitkumi/751c1ba1002636ec194b2edafee551ac)

### Adding a new config
Update the following files:  
- README.md  
- back_up.sh (include the new config)  

### Saving config
Run back_up.sh

### Restoring config
Run restore.sh
  
### Notes
- Sometimes package name gets changed which causes installation script to fail. Check Arch/AUR repo and manually update the name in `Packages` or `Packages.aur` to fix.

### TODO
- Setup cron to automatically run `back_up.sh`