#!/bin/bash

echo "Installing dev.sh"

git config --global color.ui true


\curl -L https://get.rvm.io | bash -s stable --auto-dotfiles
source ~/.zshrc
rvm get latest
rvm reload
rvm requirements

rvm install 2.2.2
source ~/.rvm/scripts/rvm
rvm --default use 2.2.2

# Install Ruby
#rbenv install 2.2.2
#rbenv global 2.2.2
#ruby -v

gem install bundler chef knife-ec2

xcode-select --install

source ~/.zshrc
gem install rails -v 4.2.4
rails -v


brew install mysql55
sudo rm -rf /var/db/receipts/com.mysql.*
#brew link mysql55 --force
brew link --overwrite mysql55 --force
# To have launchd start mysql at login:
ln -sfv /usr/local/opt/mysql/*plist ~/Library/LaunchAgents

# Then to load mysql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

gem install tmuxinator
export EDITOR='vim'

brew install imagemagick
