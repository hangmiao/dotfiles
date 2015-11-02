#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

brew tap homebrew/dupes

# cli tools
brew install ack
brew install tree
brew install wget

brew install git
brew install hub
brew install macvim --with-override-system-vim --with-python

brew install reattach-to-user-namespace
brew install tmux
brew install zsh
brew install highlight
brew install nvm
brew install z
brew install markdown
brew install nmap
brew install gpg
brew install htop
brew install mkvtoolnix
brew install boot2docker
brew install docker-compose

brew install the_silver_searcher

brew install caskroom/cask/brew-cask
brew cask install dockertoolbox
brew cask install iterm2
brew cask install firefox
brew cask install google-chrome
brew cask install dropbox
brew cask install spectacle
brew cask install quicksilver
#brew cask install the-unarchiver
brew cask install sequel-pro
brew cask install sourcetree
brew cask install virtualbox
brew cask install macvim
brew cask install wiznote

exit 0
