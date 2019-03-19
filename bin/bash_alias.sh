#!/bin/bash

# List directory contents
alias ls='ls -G'        # Compact view, show colors
alias ll='ls -al'

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories

# Tree
if [ ! -x "$(which tree)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# GIT

# Aliases
alias gap='git add -p'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gg='git grep'
alias gst='git diff --shortstat'
