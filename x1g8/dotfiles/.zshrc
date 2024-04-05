# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Loads aliases
if [ -f ~/.z_aliases ]; then
. ~/.z_aliases
fi

# Loads asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
. $HOME/.asdf/asdf.sh
fi

if [ -f $HOME/.asdf/completions/asdf.bash ]; then
. $HOME/.asdf/completions/asdf.bash
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

plugins=(git fzf)

export VISUAL=nvim

export EDITOR="$VISUAL"

# Helpful docs in Erlang
export KERL_BUILD_DOCS="yes"

export BAT_THEME="Catppuccin-mocha"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
