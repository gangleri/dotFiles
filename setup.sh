#!/usr/bin/env bash

which git ||  {echo "Install XCode cli tools first xcode-select --install" && exit 1}

# install oh-my-zsh, vundle, Homebrew, nvm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh

# generate ssh keys
for k in 'GitHub' 'GitLab'
do
	ssh-keygen -t rsa -b 4096 -f ~/.ssh/gangleri${k} -C "${EMAIL:-alan@gangleri.net}"
	ssh-add -K ~/.ssh/gangleri${k}

	pbcopy < "$HOME/.ssh/gangleri${k}"
	echo "Add key to ${k}"
	read -r -p "Press enter to continue"
done

mkdir -p ~/Code

git clone git@github.com:gangleri/dotFiles.git ~/Code/dotFiles

# install all programs listed in the brefile
{
	cd ~/Code/dotfiles/brewfile || exit 1
	brew bundle install
}

# Install fonts used by figlet, get the installed version of figlet to determine the path to write to
curl --create-dirs -o ~/.config/figlet/fonts/Bloody.flf https://raw.githubusercontent.com/xero/figlet-fonts/master/Bloody.flf

{
	# use stow to symlink dotfiles into correct locations
	cd ~/Code/dotFiles/ || exit 1
	rm ~/.zshrc
	stow --no-folding -t ~/ dotFiles
}

{
	# install mgitstatus tool 
	cd ~/Code || exit 1
	git clone https://github.com/fboender/multi-git-status.git
	cd multi-git-status || exit 1
	PREFIX=~/.local ./install.sh
}

# setup launchpad icons to smaller size
defaults write com.apple.dock springboard-rows -int 10
defaults write com.apple.dock springboard-columns -int 10; killall Dock

# screen captures
defaults write com.apple.screencapture type PNG
mkdir ~/Pictures/ScreenCaptures
defaults write com.apple.screencapture location ~/Pictures/ScreenCaptures

# show status and path in Finder windows
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder NewWindowTarget -string 'PfHm'

# Writing of .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Customise menubar
open '/System/Library/CoreServices/Menu Extras/Bluetooth.menu'
open '/System/Library/CoreServices/Menu Extras/Volume.menu'
