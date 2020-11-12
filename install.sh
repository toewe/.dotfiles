#!/bin/bash

# Get dotfiles installation directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir ~/dotfiles_backup
for file in .{bashrc,bash_prompt,bash_logout,profile,aliases,gitconfig,gitignore_global}; do
	if [ -f ~/"$file" ]; then
		cp "~/$file" "~/dotfiles_backup/$file"

ln -sf "$DOTFILES_DIR/.gitconfig" ~
ln -sf "$DOTFILES_DIR/.gitignore_global" ~
ln -sf "$DOTFILES_DIR/.bashrc" ~
ln -sf "$DOTFILES_DIR/.bash_prompt" ~
ln -sf "$DOTFILES_DIR/.bash_logout" ~
ln -sf "$DOTFILES_DIR/.profile" ~
ln -sf "$DOTFILES_DIR/.aliases" ~

