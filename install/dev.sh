#!/bin/bash

echo "Installing dev.sh"

git config --global color.ui true

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
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
gem install resque-cleaner
gem install pry-doc

gem install pg -- --with-pg-config=~/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config

source ~/.zshrc
gem install rails -v 4.2.4
rails -v

gem install ruby-beautify

mkdir -p ~/Library/LaunchAgents

brew install mysql55
sudo rm -rf /var/db/receipts/com.mysql.*
#brew link mysql55 --force
brew link --overwrite mysql55 --force
# To have launchd start mysql at login:
ln -sfv /usr/local/opt/mysql@5.5/*.plist ~/Library/LaunchAgents
brew services restart mysql55
# Then to load mysql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

brew install postgres
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist


gem install tmuxinator
gem install bluepill
gem install rack
export EDITOR='vim'

brew install imagemagick

curl -sL http://git.io/vsk46 | \
    sed -e "s?{{docker-machine}}?$(which docker-machine)?" \
        -e "s?{{user-path}}?$(echo $PATH)?" \
    >~/Library/LaunchAgents/com.docker.machine.default.plist && \
    launchctl load ~/Library/LaunchAgents/com.docker.machine.default.plist



# npm cache clean
# npm install npm -g

npm install -g yarn

npm install -g typescript
npm install -g @angular/cli@latest
npm install -g 'nightmare@^2.8.0'
npm install -g 'nightmare@2.10.0'
npm install -g 'ajv-keywords@2.1.1'
npm install -g 'ajv@^5.0.0'

npm install -g lodash
npm install -g js-beautify
npm install -g prettier
npm install -g jshint
npm install -g eslint

npm install -g instant-markdown-d
npm install -g serverless
