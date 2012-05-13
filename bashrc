# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
export PATH=/usr/local/bin:/usr/local/mysql/bin:/usr/local/pear/bin:$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin:$HOME/local/node/bin

# Set my editor and git editor
export EDITOR="/usr/bin/vim"

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# aliases
alias octave="/Applications/Octave.app/Contents/Resources/bin/octave"
alias gnuplot="/Applications/Gnuplot.app/Contents/Resources/bin/gnuplot"

# => Stolen from gary

. ~/bin/bash_colors.sh

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

# ACTUAL CUSTOMIZATION OH NOES!
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}

grb_git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local SINCE_LAST_COMMIT="$(minutes_since_last_commit)m"
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "${BRIGHT_BLUE}(%s|${SINCE_LAST_COMMIT})${NORMAL}"`
        echo ${GIT_PROMPT}
    fi
}

PS1="${GREEN}\w${NORMAL}\$(grb_git_prompt) ${BRIGHT_VIOLET}λ${NORMAL} "

source ~/bin/git-completion.bash
