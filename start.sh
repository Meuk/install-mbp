#!/bin/bash

echo "\x1B[30m \x1B[102m Setting OSX Defaults\x1B[0m"

defaults write com.apple.finder AppleShowAllFiles YES; # show hidden files
defaults write com.apple.dock persistent-apps -array; # remove icons in Dock
defaults write com.apple.dock tilesize -int 36; # smaller icon sizes in Dock
defaults write com.apple.dock autohide -bool true; # turn Dock auto-hidng on
defaults write com.apple.dock autohide-delay -float 0; # remove Dock show delay
defaults write com.apple.dock autohide-time-modifier -float 0; # remove Dock show delay
defaults write com.apple.dock orientation right; # place Dock on the right side of screen
defaults write NSGlobalDomain AppleShowAllExtensions -bool true; # show all file extensions
killall Dock 2>/dev/null;
killall Finder 2>/dev/null;

# Installing XCode
echo "\x1B[30m \x1B[102m INSTALLING XCODE\x1B[0m"
#touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
#PROD=$(softwareupdate -l |
#  grep "\*.*Command Line" |
#  head -n 1 | awk -F"*" '{print $2}' |
#  sed -e 's/^ *//' |
#  tr -d '\n')
#softwareupdate -i "$PROD" -v;
#wait
echo "\x1B[30m \x1B[102m INSTALLING PIP\x1B[0m"
sudo easy_install pip &
wait
echo "\x1B[30m \x1B[102m INSTALLING ANSIBLE\x1B[0m"
sudo pip install ansible &
wait
echo "\x1B[30m \x1B[102m CLONING PLAYBOOK\x1B[0m"
git clone git://github.com/Meuk/starter.git ~/install; cd ~/install
wait
echo "\x1B[30m \x1B[102m RUNNING PLAYBOOK\x1B[0m"
ansible-galaxy install -r requirements.yml && ansible-playbook desktop.yml
wait
