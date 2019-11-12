#!/bin/bash
declare -r TIMESTAMP="`date +%Y%m%d%H%M%S`"

declare -r ROOT_DIR=/home/takumi
declare -r REPO_DIR=$ROOT_DIR/Documents/config

declare -r DOT_DIR=$REPO_DIR/dotfiles
declare -r DOT_CONFIG_DIR=$REPO_DIR/dotconfig

# Initialize
echo 'Initializing directories..'
mkdir -p $REPO_DIR/dotfiles $REPO_DIR/dotconfig $REPO_DIR/scripts

# Installed packages
echo 'Copying installed arch packages..'
pacman -Qe > $REPO_DIR/arch.txt

# User scripts
echo 'Copying user scripts..'
cp -R $ROOT_DIR/scripts $REPO_DIR

# ~/
declare -r DOT_FILES=(
  .bashrc 
  .bash_aliases 
  .dir_colors 
  .vimrc
  .tmux.conf
)
for file in ${DOT_FILES[*]}
do
  echo "Copying $file.."
  cp -R $ROOT_DIR/$file $DOT_DIR
done

# ~/.config
declare -r DOT_CONFIG_FILES=(
  cava
  xfce4
  tmuxinator
)
for file in ${DOT_CONFIG_FILES[*]}
do
  echo "Copying $file.."
  cp -R $ROOT_DIR/.config/$file $DOT_CONFIG_DIR
done

# commit changes and push to repo
echo 'Committing changes and pushing to repo..'
git -C "$REPO_DIR" add -A
git -C "$REPO_DIR" commit -m "$TIMESTAMP" 
git -C "$REPO_DIR" push
