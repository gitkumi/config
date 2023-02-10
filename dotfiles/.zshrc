export ZSH="$HOME/.oh-my-zsh"

export VISUAL=nvim

export EDITOR="$VISUAL"

# Helpful docs in Erlang
export KERL_BUILD_DOCS="yes"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit


# Loads Z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

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

eval $(dircolors -b $HOME/.dir_colors)

