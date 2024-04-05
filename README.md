### Installation

1. Manual tasks
    - Initialize device SSH key
    - Add SSH key to GitHub
    - Install [git](https://wiki.archlinux.org/title/git) and clone this repo
      ```
          pacman -S git
          git config --global user.name "Takumi Ito"
          git config --global user.email ito.tkmi@gmail.com
      ```
    - Install [yay](https://github.com/Jguer/yay)
      
2. Run installation scripts  
      ```
      ~/install_packages.sh && ~/install_packages_aur.sh && ~/restore.sh 
      ```

    Installing may fail if one of the package names gets changed.  
    Check Arch/AUR and manually update the name in `Packages` or `Packages.aur`

3. Manual tasks that can be deferred
    - Add device to [Tailscale](https://tailscale.com/) network
    - Install asdf plugins (nodejs, elixir, erlang, and go) via [asdf-vm](https://asdf-vm.com/#/)

### Adding a new config

- Include the new config in `back_up.sh`
- Update `README.md`

### Saving config

Run `back_up.sh`

### Restoring config

Run `restore.sh`

### TODO

- Setup cron to automatically run `back_up.sh`
