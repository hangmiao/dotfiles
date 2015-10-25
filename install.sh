#!/bin/bash

echo "Installing dotfiles"

source install/link.sh

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Brewing all the things"
    source install/brew.sh

    echo "Brewing all the things"
    source install/dev.sh
    
    echo "Updating OSX settings"
    source install_osx.sh

    echo "Installing settings"
    source install/setup.sh
fi


echo "creating vim directories"
mkdir -p ~/.vim/colors
mkdir ~/.vim/plugin
# setp up Vundle
mkdir ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $HOME/Dropbox/Github/dotfiles/.vim/snippets $HOME/.vim/snippets

# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# compile ycm
brew install CMake
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --system-libclang

# ctrlp.vim:
# 1. Clone the plugin into a separate directory:
cd ~/.vim
# 2. 
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim




echo "Done."
