#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Set vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Add escripts to PATH
export PATH=$PATH:/home/takumi/.mix/escripts

# Loads Z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Loads bash aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.temp_aliases ]; then
. ~/.temp_aliases
fi

eval $(dircolors -b $HOME/.dir_colors)

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
