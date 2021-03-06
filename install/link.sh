#!/bin/bash

#DOTFILES=$HOME/Dropbox/Github/dotfiles
DOTFILES=$HOME/Development/Github/dotfiles

echo "creating symlinks"

# In bash, the -o is the equivalent of a boolean "or"
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*rc' -o -name '*conf' )


for file in $linkables ; do
    target="$HOME/$( basename $file )"
    printf $file
    printf "\n"
    echo "creating symlink for $file"
    ln -s $file $target
done

# mux completion
ln -s $DOTFILES/submodules/tmuxinator/completion/tmuxinator.zsh $HOME/tmuxinator.zsh
