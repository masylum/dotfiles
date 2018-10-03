# Load RVM, if you are using it
# [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Enable rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - --no-rehash)"
fi

# Add rvm gems and nginx to the path
export PATH=/usr/local/bin:$PATH:/opt/nginx/sbin:$HOME/local/node/bin:/usr/local/sbin

# Set my editor and git editor
export EDITOR="/usr/bin/vim"

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# aliases
alias octave="/Applications/Octave.app/Contents/Resources/bin/octave"
alias gnuplot="/Applications/Gnuplot.app/Contents/Resources/bin/gnuplot"

alias sort="/usr/local/bin/gsort"
alias xargs="/usr/local/bin/gxargs"

source ~/bin/bash_alias.sh

# => Stolen from gary

. ~/bin/bash_colors.sh

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
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
        local GIT_PROMPT=`__git_ps1 "${BRIGHT_BLUE}(%s${BRIGHT_RED}${IS_DIRTY}${BRIGHT_BLUE})${NORMAL}"`
        echo ${GIT_PROMPT}
    fi
}

PS1="${GREEN}\w${NORMAL}\$(grb_git_prompt) "
