# Linux
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"

alias ls='exa'
alias lsl='exa --oneline'
alias ll='exa --long'
alias lla='exa --long --all'
alias ltree='exa --tree --level=3'
alias lnew='exa --long --sort=new --reverse'
alias lmod='exa --long --sort=modified --reverse'

alias c='clear'
alias bye!='shutdown -h now'
alias qq='exit'

# Tar
alias untar='tar -xzvf'

# Git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gl='git log --oneline --decorate --graph'
alias glfull='git log --decorate --graph'
alias gaa='git add -A'
alias gp='git push'
alias gpl='git pull'
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
alias grb='git rebase'
alias grbi='git rebase -i'
alias uncommit='git reset --soft HEAD^'
alias gitclear='git reset --hard'
alias gitclean='git branch | grep -v "master" | xargs git branch -D'

# NPM
alias nr='npm run'

# Yarn
alias y='yarn'

# PNPM
alias p='pnpm'

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
alias pacsave='/home/takumi/Documents/config/back_up.sh'

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

# tty-clock
alias tty-clock='tty-clock -c -C 4 -n -D'

# vtop
alias vtop='vtop --theme nord'

# Mix/Elixir
alias esb='mix escript.build'
alias ectom='mix ecto.migrate'
alias ectores='mix ecto.reset'
