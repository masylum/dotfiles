. ~/bin/bash_colors.sh
. ~/bin/bash_alias.sh

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
