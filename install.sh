#!/bin/bash

echo "Installing dotfiles"

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Brewing all the things"
    source install/brew.sh

    echo "Updating OSX settings"
    source install_osx.sh

    echo "Installing settings"
    source install/setup.sh
fi

echo "creating vim directories"
mkdir -p ~/.vim
ln -s $HOME/Dropbox/Github/dotfiles/.vim/snippets $HOME/.vim/snippets


echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done."
