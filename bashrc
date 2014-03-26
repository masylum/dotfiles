# Load RVM, if you are using it
# [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Enable rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - --no-rehash)"
fi

# Add rvm gems and nginx to the path
export PATH=/usr/local/bin:/usr/local/mysql/bin:/usr/local/pear/bin:$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin:$HOME/local/node/bin:/usr/local/sbin

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

source ~/bin/git-completion.bash

function rmb {
  current_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ "$current_branch" != "develop" ]; then
    echo "WARNING: You are on branch $current_branch, NOT develop."
  fi

  echo "Fetching merged branches..."

  git remote prune origin
  remote_branches=$(git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$")
  local_branches=$(git branch --merged | grep -v 'master$' | grep -v "$current_branch$")

  if [ -z "$remote_branches" ] && [ -z "$local_branches" ]; then
    echo "No existing branches have been merged into $current_branch."
  else
    echo "This will remove the following branches:"
    if [ -n "$remote_branches" ]; then
      echo "$remote_branches"
    fi
    if [ -n "$local_branches" ]; then
      echo "$local_branches"
    fi
    read -p "Continue? (y/n): " -n 1 choice
    echo
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
      # Remove remote branches
      git push origin `git branch -r --merged | grep -v '/master$' | grep -v "/$current_branch$" | sed 's/origin\//:/g' | tr -d '\n'`
      # Remove local branches
      git branch -d `git branch --merged | grep -v 'master$' | grep -v "$current_branch$" | sed 's/origin\///g' | tr -d '\n'`
    else
      echo "No branches removed."
    fi
  fi
}

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
