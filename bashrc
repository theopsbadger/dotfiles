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

if [[ -d "$HOME/Projects/work" ]]; then
    export WORKDIR="$HOME/Projects/work"
fi

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
  elif [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
  elif [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
    . /usr/local/etc/profile.d/bash_completion.sh
  fi 
fi

# Set user bin
export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Pipenv build virtualenv in folder
export PIPENV_VENV_IN_PROJECT=1
export EDITOR=code

# golang
# Go module support
# export GO111MODULE="on"

if [[ "$OSTYPE" == "darwin"* ]]; then
	export GOPATH="$HOME/go"
	export GOROOT="$(brew --prefix)/opt/go/libexec"
else
	export GOPATH="$HOME/Projects/go"
	export GOROOT=/usr/local/go
fi

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

alias golang="cd $GOPATH"

# Andriod Development
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export ANDROID_NDK_ROOT="$ANDROID_SDK_ROOT/ndk"
export PATH="$HOME/Android/Sdk/tools:$PATH"
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "${BRANCH}"
	else
		echo ""
	fi
}

if [[ -e /usr/local/opt/kube-ps1/share/kube-ps1.sh ]]; then
    source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
    export KUBE_PS1_SYMBOL_ENABLE=false
    export KUBE_PS1_PREFIX=[
    export KUBE_PS1_SUFFIX=]
    export KUBE_PS1_DIVIDER="|"
fi

# Prompt
RCol='\033[0m'
Gre='\033[32m';
Red='\033[31m';
Blu='\033[34m';
Yel='\033[33m';

if [[ -e /usr/local/opt/kube-ps1/share/kube-ps1.sh ]]; then
 PS1="${RCol}┌─[\`if [ \$? = 0 ]; then echo "${Gre}"; else echo "${Red}"; fi\`\t\[${RCol}\]]-\$(kube_ps1)\[${RCol}\]-[\[${Yel}\w\[${RCol}\]] \`parse_git_branch\`\n└─╼ "
fi

# PyWal setting 
#(cat ~/.cache/wal/sequences &)

if command -v kubectl &> /dev/null
then
    source <(kubectl completion bash)
fi

export KUBE_EDITOR=vim


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
