# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.local/bin:$PATH"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

autoload -Uz compinit
compinit

plugins=(git fzf asdf)

if [ -f ~/.z_aliases ]; then
. ~/.z_aliases
fi

if [ -f ~/.z_keys ]; then
. ~/.z_keys
fi

if [ -f /opt/asdf-vm/asdf.sh ]; then
. /opt/asdf-vm/asdf.sh
fi

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

export VISUAL=nvim
export EDITOR="$VISUAL"
# Helpful docs in Erlang
export KERL_BUILD_DOCS="yes"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
