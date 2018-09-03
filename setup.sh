#!/bin/sh

# Find dotfile repo location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -is $DIR/.vimrc ~/.vimrc
ln -is $DIR/.editorconfig ~/.editorconfig

echo "Installing all vim plugins"
vim +'PlugInstall --sync' +qa
