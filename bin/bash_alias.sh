#!/bin/bash

# List directory contents
alias ls='ls -G'        # Compact view, show colors
alias ll='ls -al'

alias c='clear'
alias k='clear'

alias edit="$EDITOR"
alias pager="$PAGER"

alias q="exit"

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
alias	md='mkdir -p'
alias	rd=rmdir

#
# GIT
#

#!/bin/bash

# Aliases
alias gcl='git clone'
alias ga='git add'
alias g='git'
alias gst='git status'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gca='git commit -m'
alias gb='git branch'
alias gba='git branch -a'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gra='git ra'
