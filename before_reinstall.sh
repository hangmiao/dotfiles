#!/bin/bash

echo "Backup current settings..."

echo "SequelPro"
cp ~/Library/Application\ Support/Sequel\ Pro/Data/Favorites.plist ~/Library/Preferences/com.sequelpro.SequelPro.plist ~/Dropbox/Github/dotfiles/backups

echo "Done."
