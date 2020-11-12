#!/bin/bash

# Get dotfiles installation directory

mkdir -p ~/.backup_dotfiles
for file in .{bashrc,bash_prompt,bash_logout,profile,aliases,gitconfig,gitignore_global}; do
	if [ -f ~/"$file" ]; then
		echo "found $file";
		cp -iP ~/"$file" ~/.backup_dotfiles/"$file";
	fi
done;
unset file;

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cat .git_user_home .git_config_wo_user > .gitconfig

ln -sf "$DOTFILES_DIR/.gitconfig" ~
ln -sf "$DOTFILES_DIR/.gitignore_global" ~
ln -sf "$DOTFILES_DIR/.bashrc" ~
ln -sf "$DOTFILES_DIR/.bash_prompt" ~
ln -sf "$DOTFILES_DIR/.bash_logout" ~
ln -sf "$DOTFILES_DIR/.profile" ~
ln -sf "$DOTFILES_DIR/.aliases" ~
