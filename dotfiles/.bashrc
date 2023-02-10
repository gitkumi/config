#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

# Powerline
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Set nvim as default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Loads Z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Loads bash aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.temp_aliases ]; then
. ~/.temp_aliases
fi

# Loads asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
. $HOME/.asdf/asdf.sh
fi

if [ -f $HOME/.asdf/completions/asdf.bash ]; then
. $HOME/.asdf/completions/asdf.bash
fi

eval $(dircolors -b $HOME/.dir_colors)

# Helpful docs in Erlang
export KERL_BUILD_DOCS="yes"
