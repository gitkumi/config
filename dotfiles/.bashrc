#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

# Set vim as default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Add escripts to PATH
export PATH=$PATH:/home/takumi/.asdf/installs/elixir/1.11.2/.mix/escripts

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
