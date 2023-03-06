### Installation

1. Manual tasks
    - Initialize device SSH key
    - Add SSH key to GitHub
    - Install [yay](https://github.com/Jguer/yay)
    - Install [git](https://wiki.archlinux.org/title/git) and clone this repo
      ```
      pacman -S git && cd ~ && git clone git@github.com:gitkumi/config.git
      ```
      
2. Run installation scripts  
      ```
      cd ~/config && install_packages.sh && install_packages_aur.sh && restore.sh 
      ```

    Installing may fail if one of the package names gets changed.  
    Check Arch/AUR and manually update the name in `Packages` or `Packages.aur`

3. Manual tasks that can be deferred
    - Setup xfce panels (?)
    - Setup lightdm/greeter
    - Add device to [Tailscale](https://tailscale.com/) network
    - Install asdf plugins (nodejs, elixir, and erlang, go) via [asdf-vm](https://asdf-vm.com/#/)
    - Sync VS Code Settings

### Adding a new config

- Include the new config in `back_up.sh`
- Update `README.md`

### Saving config

Run `back_up.sh`

### Restoring config

Run `restore.sh`

### TODO

- Setup cron to automatically run `back_up.sh`
