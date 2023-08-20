# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

export VISUAL=nvim

export EDITOR="$VISUAL"

# Helpful docs in Erlang
export KERL_BUILD_DOCS="yes"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# Enable autocomplete in zsh
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Loads Z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Loads aliases
if [ -f ~/.z_aliases ]; then
. ~/.z_aliases
fi

# Loads temporary stuff
if [ -f ~/.z_temp ]; then
. ~/.z_temp
fi

# Loads asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
. $HOME/.asdf/asdf.sh
fi

if [ -f $HOME/.asdf/completions/asdf.bash ]; then
. $HOME/.asdf/completions/asdf.bash
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.fly/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/takumi/google-cloud-sdk/path.zsh.inc' ]; then . '/home/takumi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/takumi/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/takumi/google-cloud-sdk/completion.zsh.inc'; fi
