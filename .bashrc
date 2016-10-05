# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.aliases
source ~/.paths
#source ~/.profile
#source ~/.bash_profile

# Access nth most recent modified file.
latestn(){
  \ls -t | head -n $1 | tail -n 1  
}

# most recently modified files in this directory and all subdirectories.
# All credit to stackoverflow.
latestr(){
  find . -type f -printf '%T@ %p\n' | sort -n | tail -n $1 | cut -f2 -d" "
}

#if [[ ! $TERM =~ screen ]]; then
#    exec tmux
#fi 

# unset gui password tool
unset SSH_ASKPASS

# Colorize PS1, and add git branch. See https://github.com/jimeh/git-aware-prompt.
export GITAWAREPROMPT=~/.bash/git-aware-prompt 
source "${GITAWAREPROMPT}/main.sh" 2>/dev/null 
# export PS1="\[$(tput setaf 4)\][\[$(tput setaf 4)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 4)\] \[$ "
export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

export TERM="xterm-256color"
