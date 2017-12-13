# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.aliases
source ~/.paths


# Access nth most recent modified file.
latestn(){
  \ls -t | head -n $1 | tail -n 1
}

# most recently modified files in this directory and all subdirectories.
# All credit to stackoverflow.
latestr(){
  find . -type f -printf '%T@ %p\n' | sort -n | tail -n $1 | cut -f2 -d" "
}

# Hide files from ls
hide="--hide='*.aux' --hide='*.bbl' --hide='*.blg' --hide='*.fls' --hide='*.log' --hide='*.nav' --hide='*.out' --hide='*.snm' -\-hide='*.thm' --hide='*.toc' --hide='*~'"

alias ls="ls --color=auto --sort=extension --group-directories-first $hide"


# unset gui password tool
unset SSH_ASKPASS

# Colorize PS1, and add git branch. See https://github.com/jimeh/git-aware-prompt.
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh" 2>/dev/null
export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

export TERM="xterm-256color"


# 1. cache display outside of tmux
# 2. launch tmux, and parse display in each pane
cache_display() {
  echo "$DISPLAY" > ~/.DISPLAY
  echo "DISPLAY cached as $DISPLAY"
}

parse_display() {
  DISPLAY_OLD="$DISPLAY"
  export DISPLAY="$(cat ~/.DISPLAY)"
  echo "DISPLAY updated from $DISPLAY_OLD to $DISPLAY"
}


# Set grep options
export GREP_OPTIONS='-inr --color=auto'

# Evince launches in the background
ev() { evince "$@" 2>/dev/null & }