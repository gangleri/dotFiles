#!/usr/bin/env bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

repos=(
	'git@github.com:gangleri/vimrc.git'
	'git@github.com:gangleri/zsh-config.git'
	'git@github.com:gangleri/ssh.git'
	'git@github.com:gangleri/gitConfig.git'
	'git@github.com:gangleri/dotFiles.git'
	'git@github.com:gangleri/brewfile.git'
	'git@github.com:gangleri/iterm.git'
)

for i in "${repos[@]}" 
do 
	git clone "$i" 
done

stow -t ~. ../*

