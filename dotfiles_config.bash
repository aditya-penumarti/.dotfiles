#!/bin/bash

# Addin the zoxide config, ensuring that the same line has not been echo'd into the original bashrc previously
echo "Adding Zoxide configuration"
grep -qxF "source $HOME/.dotfiles/.zoxide" "$HOME/.bashrc" || echo "source \$HOME/.dotfiles/.zoxide" >> "$HOME/.bashrc"

# Checking if the vimrc file exists, if not symbolic link it
echo "Symbolically linking the .vimrc file to the home directory"
[ -L "$HOME/.vimrc" ] && [ "$(readlink "$HOME/.vimrc")" = "$HOME/.dotfiles/.vimrc" ] || [ -e "$HOME/.vimrc" ] || ln -s "$HOME/.dotfiles/.vimrc" "$HOME/.vimrc"


# Move the old .gitconfig to a backup file, and symbolically link the .gitconfig file from this repo to the one in the home directory

echo "Moving .gitconfig in the home folder to .gitconfig.backup and symbolically linking the custom .gitconfig file."
[ -f "$HOME/.gitconfig" ] && mv "$HOME/.gitconfig" "$HOME/.gitconfig.backup"
ln -s "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"

