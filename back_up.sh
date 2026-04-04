#!/bin/bash

set -euo pipefail

DEVICE=$(hostname)
TIMESTAMP=$(date +%Y%m%d%H%M%S)

REPO_DIR="$HOME/config"
CONFIG_DIR="$REPO_DIR/$DEVICE"
DOT_DIR="$CONFIG_DIR/dotfiles"
DOT_CONFIG_DIR="$CONFIG_DIR/dotconfig"
PACKAGE_FILE="$CONFIG_DIR/Packages"
AUR_PACKAGE_FILE="$CONFIG_DIR/Packages.aur"

if [[ ! -f /etc/os-release ]]; then
  echo "Could not detect operating system: /etc/os-release is missing"
  exit 1
fi

. /etc/os-release

# ~/
DOT_FILES=(
  .zshrc
  .zprofile
  .z_aliases
  .p10k.zsh
  .tmux.conf
  .tool-versions
  # TODO: Need to support multiple gitconfig
  .gitconfig
  .gitconfig.bak
  .sqliterc
)

# ~/.config
DOT_CONFIG_FILES=(
  nvim
  alacritty
  ghostty
  zellij
)

# Delete existing folders
rm -rf "$DOT_DIR" "$DOT_CONFIG_DIR"

# Initialize
echo "Device: $DEVICE"
echo "OS: ${ID:-unknown}"
echo "Initializing directories.."
mkdir -p "$DOT_DIR" "$DOT_CONFIG_DIR"

# Save installed packages
case "${ID:-}" in
  arch)
    echo "Copying installed Arch packages.."
    pacman -Qqen > "$PACKAGE_FILE"

    echo "Copying installed Arch packages (AUR).."
    pacman -Qqem > "$AUR_PACKAGE_FILE"
    ;;
  ubuntu)
    echo "Copying installed Ubuntu packages.."
    apt-mark showmanual | sort > "$PACKAGE_FILE"
    rm -f "$AUR_PACKAGE_FILE"
    ;;
  *)
    echo "Unsupported distribution: ${ID:-unknown}"
    exit 1
    ;;
esac

# ~/
for file in "${DOT_FILES[@]}"
do
  echo "Copying $file.."
  cp -R "$HOME/$file" "$DOT_DIR"
done

# ~/.config
for file in "${DOT_CONFIG_FILES[@]}"
do
  echo "Copying $file.."
  cp -R "$HOME/.config/$file" "$DOT_CONFIG_DIR"
done

# commit changes and push to repo
echo "Committing changes and pushing to repo.."
git -C "$REPO_DIR" add -A
git -C "$REPO_DIR" commit -m "$TIMESTAMP"
git -C "$REPO_DIR" rebase origin/master
git -C "$REPO_DIR" push
