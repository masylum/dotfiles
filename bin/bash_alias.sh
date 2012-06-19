#!/bin/bash

# List directory contents
alias ls='ls -G'        # Compact view, show colors
alias ll='ls -al'

alias c='clear'
alias k='clear'

alias edit="$EDITOR"
alias pager="$PAGER"

alias irc="$IRC_CLIENT"

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up two directories
alias -- -="cd -"        # Go back

# Shell History
alias h='history'

# Tree
if [ ! -x "$(which tree)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Directory
alias md='mkdir -p'
alias rd=rmdir

#
# GIT
#

#!/bin/bash

# Aliases
alias gap='git add -p'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gra='git ra'
alias gg='git grep'
alias gst='git diff --shortstat'
