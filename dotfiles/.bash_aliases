# Linux
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"

alias ls='exa --oneline'
alias ll='exa --long'
alias lla='exa --long --all'
alias ltree='exa --tree --level=3'
alias lgrid='exa'
alias lnew='exa --long --sort=new --reverse'
alias lmod='exa --long --sort=modified --reverse'

alias c='clear'
alias bye!='shutdown -h now'

# Tar
alias untar='tar -xzvf'

#OpenVPN
alias vpn='sudo openvpn'

# Git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gl='git log --oneline --decorate --graph'
alias glfull='git log --decorate --graph'
alias gaa='git add -A'
alias gp='git push'
alias gr='git remote'
alias grv='git remote -v'
alias gcl='git clone'
alias gch='git checkout'
alias gb='git branch'
alias gchb='git checkout -b'
alias gcm='git commit -v'
alias gcmm='git commit -m'
alias gcma='git commit --amend -v'
alias gcma!='git commit --amend --no-edit'
alias grbi='git rebase -i'

# Yarn
alias y='yarn'

# Yay/Pacman
alias yayin='yay -S'
alias yayre='yay -Rns'
alias pacin='sudo pacman -S'
alias pacre='sudo pacman -Rns'
alias pacupg='sudo pacman -Syu'
alias pacser='pacman -Ss'
alias pacorph='sudo pacman -Qdt'
alias pacreorph='sudo pacman -Rns $(pacman -Qtdq)'
alias pacls='pacman -Qe'
alias pacsave='/home/takumi/Documents/config/copy.sh'

# Systemd
alias syse='sudo systemctl enable'
alias sysd='sudo systemctl disable'
alias sysq='sudo systemctl stop'
alias sysg='sudo systemctl start'
alias sysr='sudo systemctl restart'
alias syss='systemctl status'

# Googler
alias google='googler --count 5'
alias goo='googler --count 5'

# Tmuxinator
alias rice='tmuxinator rice'
alias xrice='tmux kill-session -t rice'

alias music='tmuxinator music'
alias xmusic='tmux kill-session -t music'

# tty-clock
alias tty-clock='tty-clock -c -C 4 -n -D'

# Ecto
alias ectom='mix ecto.migrate'
alias ectores='mix ecto.reset'
