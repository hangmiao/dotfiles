#!/bin/bash

echo "Installing dotfiles"

# Link all the dot files
source install/link.sh

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Updating OSX settings"
    source install/osx.sh

    echo "Brewing all the things"
    source install/brew.sh

    echo "Setting up vim"
    source install/vim.sh

    echo "Brewing all the things"
    source install/dev.sh
    
    echo "Installing settings"
    source install/setup.sh
fi


echo "Done."
