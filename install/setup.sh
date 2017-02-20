#!/bin/sh

# curl -L http://install.ohmyz.sh | sh
# cp $HOME/Dropbox/Github/dotfiles/.oh-my-zsh/themes/robbyrussell.zsh-theme $HOME/.oh-my-zsh/themes/robbyrussell.zsh-theme

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cp ~/Dropbox/Github/dotfiles/.zprezto/modules/prompt/functions/prompt_hahn_setup ~/.zprezto/modules/prompt/functions/prompt_hahn_setup

mkdir ~/bin
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/bin/subl
