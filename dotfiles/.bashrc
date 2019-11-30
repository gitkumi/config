#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Loads Z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Set vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Loads bash aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.temp_aliases ]; then
. ~/.temp_aliases
fi

# Add escripts to PATH
export PATH=$PATH:/home/takumi/.mix/escripts

eval $(dircolors -b $HOME/.dir_colors)
