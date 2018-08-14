#!/bin/bash

# Find dotfile repo location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -s $DIR/.vimrc ~/.vimrc

