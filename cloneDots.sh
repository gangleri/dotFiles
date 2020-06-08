#!/usr/bin/env bash

# install oh-my-zsh, vundle, Homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

repos=(
	'git@github.com:gangleri/vimrc.git'
	'git@github.com:gangleri/zsh-config.git'
	'git@github.com:gangleri/ssh.git'
	'git@github.com:gangleri/gitConfig.git'
	'git@github.com:gangleri/dotFiles.git'
	'git@github.com:gangleri/brewfile.git'
	'git@github.com:gangleri/iterm.git'
)

# clone the repos
for i in "${repos[@]}" 
do 
	git clone "$i" 
done

# install all programs listed in the brefile
cd brewfile
brew bundle install
cd ..

# Install fonts used by figlet
curl -o /usr/local/Cellar/figlet/2.2.5/share/figlet/fonts/Bloody.flf https://raw.githubusercontent.com/xero/figlet-fonts/master/Bloody.flf

# use stow to symlink dotfiles into correct locations
for D in ../*
do
	echo $(basename $D)
	stow -d ../ -t ~/. $(basename "$D")
done

# install mgitstatus tool 
cd ~/Code
git clone https://github.com/fboender/multi-git-status.git
cd multi-git-status
PREFIX=~/.local ./install.sh
