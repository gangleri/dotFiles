#!/usr/bin/env bash

which git ||  (echo "Install XCode cli tools and accept the license xcode-select --install && sudo xcodebuild -license" && exit 1)

# install oh-my-zsh, vundle, Homebrew
curl -o- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
curl -o- https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# generate ssh keys
ssh-keygen -t ed25519 -f ~/.ssh/gangleriGitHub -C "${EMAIL:-alan@gangleri.net}"
ssh-add -K ~/.ssh/gangleri${k}

pbcopy < "$HOME/.ssh/gangleriGitHub.pub"
echo "Press enter to continue"
read <&9

eval "$(ssh-agent -s)"

echo "Press enter to continue"
read <&9

mkdir -p ~/Code

git clone git@github.com:gangleri/dotFiles.git ~/Code/dotFiles

# install all programs listed in the brefile
{
	cd ~/Code/dotfiles/brewfile || exit 1
	brew bundle install
}

sudo xcodebuild -license accept

# Install fonts used by figlet, get the installed version of figlet to determine the path to write to
curl --create-dirs -o ~/.config/figlet/fonts/Bloody.flf https://raw.githubusercontent.com/xero/figlet-fonts/master/Bloody.flf

{
	# use stow to symlink dotfiles into correct locations
	cd ~/Code/dotFiles/dotFiles || exit 1
	rm ~/.zshrc
	stow -v --no-folding -t ~ *
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
open '/System/Library/CoreServices/Menu Extras/Volume.menu'
