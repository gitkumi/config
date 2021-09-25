## dotfiles
- Files stored on ~

## dotconfig
- Files stored on ~/.config

## scripts
- User scripts

## Installed packages 
- Packages  
- Packages.aur  

## ~/
- .bash_aliases 
- .bashrc 
- .xprofile 
- .dir_colors 
- .vimrc
- .tmux.conf
- .tool-versions
- .Xmodmap

## ~/.config/
- xfce4
- cava
- tmuxinator
- nvim (neovim)

## Updating
- Run back_up.sh

## Adding config
- Update back_up.sh to include new config

## Manual Installation
- yay (https://github.com/Jguer/yay)
- asdf-vm (https://asdf-vm.com/#/) (nodejs, elixir, erlang)
- VS Code extensions (install Settings Sync and provide the gist https://gist.github.com/gitkumi/751c1ba1002636ec194b2edafee551ac)

## Restoring
- Do manual installation first (need yay to install AUR packages)
- Run install_packages.sh, install_packages_aur.sh, and restore.sh

## Notes
- When running install_package.sh or install_packages_aur.sh and a package is not found, it will fail. Should check the Arch/AUR repo and manually update the name. (most probably it was changed)
