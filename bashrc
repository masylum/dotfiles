#!/bin/bash

. ~/bin/bash_colors.sh
. ~/bin/bash_alias.sh

# Hack for Factorial
export $OS="OSX"

# Enable rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - --no-rehash)"
fi

# Add rvm gems and nginx to the path
export PATH=/usr/local/bin:$PATH:/opt/nginx/sbin:$HOME/local/node/bin:/usr/local/sbin

# Set the editor and git editor
export EDITOR="/usr/bin/vim"

# Set the vi mode for bash
set -o vi

# => Stolen from gary

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

function __git_dirty {
  git diff --quiet HEAD &>/dev/null
  [ $? == 1 ] && echo "!"
}

grb_git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local IS_DIRTY="$(__git_dirty)"
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "${BRIGHT_BLUE}(%s${BRIGHT_RED}${IS_DIRTY}${BRIGHT_BLUE})${NORMAL}"`
        echo ${GIT_PROMPT}
    fi
}

source ~/bin/git-completion.bash

PS1="${GREEN}\w${NORMAL}\$(grb_git_prompt) "
