#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."


brew update
brew tap homebrew/services

brew install rbenv
brew install readline
brew install ruby-build
brew install mongodb
brew install dynamodb-local
brew install mysql@5.5
brew install redis28
brew install imagemagick@6
brew install scala
brew install sbt
brew install logstash

brew link imagemagick@6 --force
# For mongodb
sudo mkdir -p /data/db
sudo chown -R `id -u` /data/db

# cli tools
brew install ack
brew install fzf
brew install tree
brew install wget
brew install terraform

brew install git
brew install hub
brew install colordiff
#brew install macvim --with-override-system-vim --with-python
#brew link --overwrite macvim
#brew linkapps macvim
# brew install vim --with-python3 --with-cscope --with-lua
# brew link --overwrite vim
# brew linkapps vim
# brew linkapps macvim

brew tap neovim/neovim
brew tap gemfury/tap

brew install --HEAD neovim
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
brew install CMake
brew install mkvtoolnix
brew install rename
brew install the_silver_searcher
brew install coreutils
brew install w3m
brew install gpg
brew install cowsay
brew install fortune
brew install ffmpeg
brew install archey
brew install awscli
brew install ctop
brew install ctags-exuberant
brew install youtube-dl
brew install gemfury

brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew cask install java
brew cask install dockertoolbox
brew cask install kitematic
brew cask install iterm2
brew cask install firefox
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install dropbox
brew cask install spectacle
brew cask install quicksilver
#brew cask install the-unarchiver
brew cask install sequel-pro
brew cask install sql-tabs
brew cask install sourcetree
brew cask install virtualbox
brew cask install quiver
brew cask install vimr
brew cask install macvim
brew cask install libreoffice
brew cask install adobe-reader
brew cask install ldoce5-viewer
brew cask install slack
brew cask install skitch
brew cask install rcdefaultapp
brew cask install seil
brew cask install utc-menu-clock
brew cask install caffeine
brew cask install dash

# brew install pandoc
# brew install lynx
brew install node

brew cask install wiznote

brew cask install sublime-text3
brew tap gwerbin/tap
brew install --HEAD gwerbin/tap/neovim-qt

brew cask cleanup
brew services start --all
