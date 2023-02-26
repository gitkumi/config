#!/bin/bash

while getopts "d:" arg; do
  case $arg in
    d) declare -r DEVICE=$OPTARG;;
  esac
done

if [ -z "$DEVICE" ]; then
  echo "Device is required."
  exit 1;
fi

echo "Device: $DEVICE"

declare -r TIMESTAMP="`date +%Y%m%d%H%M%S`"

declare -r USER=$(whoami)
declare -r USER_DIR=/home/$USER
declare -r REPO_DIR=$USER_DIR/config

declare -r DOT_DIR=$REPO_DIR/dotfiles
declare -r DOT_CONFIG_DIR=$REPO_DIR/dotconfig

# ~/
declare -r DOT_FILES=(
  .zshrc
  .z_aliases
  .p10k.zsh
  .xprofile
  .dir_colors 
  .tmux.conf
  .tool-versions
  .Xmodmap
)

# ~/.config
declare -r DOT_CONFIG_FILES=(
  cava
  xfce4
  tmuxinator
  nvim
  alacritty
  user-dirs.dirs
)

# Delete existing folders
rm -rf $DEVICE/$DOT_DIR $DEVICE/$DOT_CONFIG_DIR

# Initialize
echo "Initializing directories.."
mkdir -p $DEVICE/$DOT_DIR $DEVICE/$DOT_CONFIG_DIR

# Save installed packages
echo "Copying installed arch packages.."
pacman -Qqen > $REPO_DIR/$DEVICE/Packages

# Save installed packages
echo "Copying installed arch packages (AUR).."
pacman -Qqem > $REPO_DIR/$DEVICE/Packages.aur

# ~/
for file in ${DOT_FILES[*]}
do
  echo "Copying $USER_DIR/$file to $DEVICE/$DOT_DIR.."
  cp -R $USER_DIR/$file ./$DEVICE/$DOT_DIR
done

# ~/.config
for file in ${DOT_CONFIG_FILES[*]}
do
  echo "Copying $USER_DIR/.config/$file to $DEVICE/$DOT_CONFIG_DIR.."
  cp -R $USER_DIR/.config/$file ./$DEVICE/$DOT_CONFIG_DIR
done

# commit changes and push to repo
echo "Committing changes and pushing to repo.."
git -C "$REPO_DIR" add -A
git -C "$REPO_DIR" commit -m "$TIMESTAMP" 
git -C "$REPO_DIR" push
