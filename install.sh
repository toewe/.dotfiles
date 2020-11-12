#!/bin/bash

# Get dotfiles installation directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Set help message
help_msg="install dotfiles: -h for this help, -work for git work_user, -home for git private user";
backup_msg="-----Copying existing dotfiles to ~/.backup_dotfiles"
symlink_msg="-----Creating symlinks for dotfiles"

# options
if  [[ $1 = "" ]]; then
	echo $help_msg;
elif [[ $1 = "-h" ]]; then
	echo $help_msg;
elif [[ $1 = "-work" ]]; then
	echo $backup_msg
	"$DOTFILES_DIR/backup.sh";
	cat "$DOTFILES_DIR/files/git_user_work" "$DOTFILES_DIR/files/git_config_wo_user" > "$DOTFILES_DIR/files/.gitconfig";
	echo $symlink_msg	
	"$DOTFILES_DIR/create_links.sh";
elif [[ $1 = "-home" ]]; then
	echo $backup_msg
	"$DOTFILES_DIR/backup.sh";
	cat "$DOTFILES_DIR/files/git_user_home" "$DOTFILES_DIR/files/git_config_wo_user" > "$DOTFILES_DIR/files/.gitconfig";
	echo $symlink_msg	
	"$DOTFILES_DIR/create_links.sh";
fi

