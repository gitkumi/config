# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

custom_paths=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
)
for dir in "${custom_paths[@]}"; do
  [[ -d "$dir" && ":$PATH:" != *":$dir:"* ]] && PATH="$dir:$PATH"
done
export PATH

if [ -f /home/takumi/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme ]; then
  source /home/takumi/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
fi

autoload -Uz compinit
compinit

plugins=(git fzf zellij)

if [ -f ~/.z_aliases ]; then
. ~/.z_aliases
fi

if [ -f ~/.z_keys ]; then
. ~/.z_keys
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

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

# pnpm
export PNPM_HOME="/home/takumi/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
