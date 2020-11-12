#!/bin/bash

# Get dotfiles installation directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.backup_dotfiles
#for file in .{bashrc,bash_prompt,bash_logout,profile,aliases,gitconfig,gitignore_global}; do
#	if [ -f ~/"$file" ]; then
#		cp -iP ~/"$file" ~/.backup_dotfiles/"$file";
#	fi
#done;
#unset file;

find $DOTFILES_DIR/files -iname ".*" | while read f
do	
	f_name="$(basename $f)"
	if ! [[ -L ~/"$f_name" ]] && [[ -f ~/"$f_name" ]]; then
		cp -P ~/"$f_name" ~/.backup_dotfiles/"$f_name";
		echo "moved $f_name"
	fi
		
done
