#!/usr/bin/env sh

xcode-select --install

# echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# echo "expand save dialog by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# echo "show the ~/Library folder in Finder"
chflags nohidden ~/Library

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Enable subpixel font rendering on non-Apple LCDs"
#defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false


echo "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

#Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02

#Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Disable opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Enable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

echo "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

# Change screenshot name
killall SystemUIServer
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture name ""

# Set the Default Finder View Style to Column
defaults write com.apple.Finder FXPreferredViewStyle clmv
killall Finder


