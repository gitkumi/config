# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

plugins=(git fzf)

# Loads aliases
if [ -f ~/.z_aliases ]; then
. ~/.z_aliases
fi

. /opt/asdf-vm/asdf.sh

eval "$(zoxide init zsh)"

export VISUAL=nvim

export EDITOR="$VISUAL"

# Helpful docs in Erlang
export KERL_BUILD_DOCS="yes"

export BAT_THEME="Catppuccin-mocha"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
