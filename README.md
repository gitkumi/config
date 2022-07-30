```
dotfiles (Files stored on ~)
- .bash_aliases
- .bashrc
- .xprofile
- .dir_colors
- .tmux.conf
- .tool-versions
- .Xmodmap

dotconfig (Files stored on ~/.config)
- xfce4
- cava
- tmuxinator
- nvim

scripts
- User scripts

Installed packages
- Packages
- Packages.aur
```

### Adding config
- Update README.md and back_up.sh to include the new config
    
### Saving config
- Run back_up.sh

### Installing
- Do manual installation first
- Run install_packages.sh, install_packages_aur.sh, and restore.sh

#### Manual installation
- [yay](https://github.com/Jguer/yay)  
  Required to install AUR packages
  
- [asdf-vm](https://asdf-vm.com/#/)  
  Install nodejs, elixir, erlang
  
- VS Code extensions  
  Install Settings Sync and provide this [gist](https://gist.github.com/gitkumi/751c1ba1002636ec194b2edafee551ac)

### Notes
- Sometimes package name gets changed which causes installation script to fail. Check Arch/AUR repo and manually update the name to fix.
