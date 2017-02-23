#!/bin/bash

echo "Restore backup settings..."

echo "SequelPro"
cp ~/Dropbox/Github/dotfiles/backups/Favorites.plist ~/Library/Application\ Support/Sequel\ Pro/Data/
cp ~/Dropbox/Github/dotfiles/backups/com.sequelpro.SequelPro.plist ~/Library/Preferences/

echo "Done."
