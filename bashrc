# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#if [ -f ~/.work ]; then
#    . ~/.work
#fi

# Add work related stuff
# https://github.com/mathiasbynens/dotfiles/blob/master/.bash_profile

for file in ~/.{aliases,work}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Miniconda Setup

if [ -d "$HOME/miniconda3/bin" ]; then
  export PATH="$HOME/miniconda3/bin":$PATH
fi

# Pipenv build virtualenv in folder
export PIPENV_VENV_IN_PROJECT=1
export EDITOR=code

# golang
# Go module support
export GO111MODULE="on"

export GOPATH="$HOME/Projects/go"
export GOROOT=/usr/local/go

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

alias golang="cd $GOPATH"

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "[${BRANCH}]"
	else
		echo ""
	fi
}

# Prompt
RCol='\033[0m'
Gre='\033[32m';
Red='\033[31m';
Blu='\033[34m';
Yel='\033[33m';
PS1="${RCol}┌─[\`if [ \$? = 0 ]; then echo "${Gre}"; else echo "${Red}"; fi\`\t\[${Rcol}\] \[${Blu}\]\h\[${RCol}\] \[${Yel}\]\w\[${RCol}\]] \`parse_git_branch\`\n└─╼ "

# PyWal setting 
#(cat ~/.cache/wal/sequences &)
