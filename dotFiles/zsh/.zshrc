# zmodload zsh/zprof
source /opt/homebrew/share/antigen/antigen.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

antigen use oh-my-zsh

fpath+=~/.zfunc

ZSH_THEME="agnoster"
CASE_SENSITIVE="false" # Case insensitive completion
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

# Register plugins included with oh-my-zsh
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle cp
antigen bundle dirhistory
antigen bundle docker
antigen bundle git
antigen bundle golang
antigen bundle history-substring-search
antigen bundle kubectl
antigen bundle npm
antigen bundle pep8
antigen bundle pyenv
antigen bundle pip
antigen bundle pipenv
antigen bundle ssh-agent
antigen bundle sudo
antigen bundle vi-mode
antigen bundle virtualenv
antigen bundle vue
antigen bundle yarn
antigen bundle zsh-autosuggestions
antigen bundle zsh-syntax-highlighting
antigen bundle zsh_reload

# Register other zsh plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme agnoster
antigen apply

export HSTR_CONFIG=hicolor
export ANDROID_HOME=${HOME}/Library/Android/sdk
export BROWSER=chromium
export DEFAULT_USER=$USER
export EDITOR="nvim"
export GIT_EDITOR=$EDITOR
# export GOPATH=$(go env GOPATH)
export HH_CONFIG=hicolor        # get more colors
export HISTSIZE=999999999
export HISTFILE=~/.zsh_history  # ensure history file visibility
export SAVEHIST=$HISTSIZE
export LANG=en_GB.UTF-8
export PATH="${PATH}:$HOME/.bin"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH=$PATH:$HOME/go/bin:$HOME/.cargo/bin
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${HOME}/flutter/bin
export PATH=${PATH}:${HOME}/opt/GNAT/2020/bin
export MANPATH="/usr/local/opt/make/libexec/gnuman:/usr/local/opt/erlang/lib/erlang/man:$MANPATH"
export UPDATE_ZSH_DAYS=3

hash -d code=$HOME/Code
hash -d dotfiles=$HOME/Code/dotFiles
hash -d downloads=$HOME/Downloads
hash -d go=$HOME/go/src
hash -d icloud=$HOME/Library/Mobile\ Documents/com~apple~CloudDocs

setopt EXTENDED_GLOB
setopt NO_BEEP
setopt autocd
setopt complete_aliases
setopt nocaseglob
setopt numericglobsort
setopt hist_ignore_all_dups

alias ..='cd ..'
alias vi='nvim'
alias vim='nvim'
alias vimrc='$EDITOR ~/.config/nvim/init.vim'
alias vimupdate='vim +PluginInstall +qall'
alias zc='zcalc'
alias zshrc='$EDITOR ~/.zshrc'

alias pipo='pip list --outdated'
alias pipu='pip list --outdated | tail +3 | cut -d' ' -f 1 | xargs -n1 pip install -U'

alias pipo3='pip3 list --outdated'
alias ppu3='pip3 list --outdated | tail +3 | cut -d' ' -f 1 | xargs -n1 pip3 install -U'

alias tree='tree -C'

alias grep="ggrep $GREP_OPTIONS"

alias mgit="mgitstatus"

alias b="brew"

alias l='colorls --group-directories-first --almost-all'
alias lt='colorls --group-directories-first --almost-all --tree'
alias ll='colorls --group-directories-first --almost-all --long'

alias cat='bat'

# Wrap the cat command so that if it's called directly highlight is used but 
# if it is being called as part of a pipe standard cat will be used
# function cat {
# 	if [ -t 1 ]; then
# 		highlight -O ansi --force $@
# 	else
# 		command cat $@
# 	fi
# }

autoload zmv
autoload zcalc

zstyle ':completion:*' completer _expand _complete _correct
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' squeeze-slashes true

# [ -f "$HOME/.travis/travis.sh" ] && source $HOME/.travis/travis.sh
# [ -f "$HOME/.config/exercism/exercism_completion.zsh" ] && source ~/.config/exercism/exercism_completion.zsh


# placing the key bindings here allowed them to be picked up and applied correctly
# other plug-ins attempt to bing ^r so by having it here its the last and will be
# the one applied
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey -s '^r' 'hh\n'
bindkey -s '^q' 'br\n'

if [ -f "$HOME/.secrets" ]; then
	source "$HOME/.secrets"
fi

# lolcat -t "${HOME}/.skull"

# added by pipsi (https://github.com/mitsuhiko/pipsi)
export PATH="${HOME}/.local/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alan/Applications/gcloud-sdk/path.zsh.inc' ]; then . '/Users/alan/Applications/gcloud-sdk/path.zsh.inc'; fi

export PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin"

# source /Users/alan/Library/Preferences/org.dystroy.broot/launcher/bash/br
eval "$(pyenv init --path)"
eval "$(rbenv init -)"
eval "$(nodenv init -)"

 eval "$(starship init zsh)"
