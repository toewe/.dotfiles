#!/bin/bash

# Get dotfiles installation directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#for file in $DOTFILES_DIR/../files/*; do
#	echo "$file"
#done;

leading_dot="./"

find ./files -iname ".*" | while read f
do
	f_name=${f#"$leading_dot"}
	echo "$DOTFILES_DIR/$f_name"
	echo "creating symlink in ~ to $DOTFILES_DIR/$f_name"
	ln -sf "$DOTFILES_DIR/$f_name" ~
done
		
#ln -sf "$DOTFILES_DIR/.gitconfig" ~
#ln -sf "$DOTFILES_DIR/.gitignore_global" ~
#ln -sf "$DOTFILES_DIR/.bashrc" ~
#ln -sf "$DOTFILES_DIR/.bash_prompt" ~
#ln -sf "$DOTFILES_DIR/.bash_logout" ~
#ln -sf "$DOTFILES_DIR/.profile" ~
#ln -sf "$DOTFILES_DIR/.aliases" ~
