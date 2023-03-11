#!/bin/bash

declare -r DEVICE="$(hostname)"

if [ -z "$DEVICE" ]; then
  echo "Device is required."
  exit 1;
fi

declare -r TIMESTAMP="`date +%Y%m%d%H%M%S`"

declare -r USER=$(whoami)
declare -r USER_DIR=/home/$USER
declare -r CONFIG_DIR=$USER_DIR/config/$DEVICE

declare -r DOT_DIR=$CONFIG_DIR/dotfiles
declare -r DOT_CONFIG_DIR=$CONFIG_DIR/dotconfig

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
rm -rf $DOT_DIR $DOT_CONFIG_DIR

# Initialize
echo "Device: $DEVICE"
echo "Initializing directories.."
mkdir -p $DOT_DIR $DOT_CONFIG_DIR

# Save installed packages
echo "Copying installed arch packages.."
pacman -Qqen > $CONFIG_DIR/Packages

# Save installed packages
echo "Copying installed arch packages (AUR).."
pacman -Qqem > $CONFIG_DIR/Packages.aur

# ~/
for file in ${DOT_FILES[*]}
do
  echo "Copying $file.."
  cp -R $USER_DIR/$file $DOT_DIR
done

# ~/.config
for file in ${DOT_CONFIG_FILES[*]}
do
  echo "Copying $file.."
  cp -R $USER_DIR/.config/$file $DOT_CONFIG_DIR
done

# commit changes and push to repo
echo "Committing changes and pushing to repo.."
git -C "$CONFIG_DIR" add -A
git -C "$CONFIG_DIR" commit -m "$TIMESTAMP" 
git -C "$CONFIG_DIR" rebase origin/master
git -C "$CONFIG_DIR" push
