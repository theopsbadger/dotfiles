# LS Color
alias ll="ls -lhaF --color=auto"
alias la="ls -A --color=auto"
alias l="ls -CF --color=auto"

# Dir
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

# Grep color
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Create directory
alias mkdir="mkdir -p"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Anyconnect
alias vpn="/opt/cisco/anyconnect/bin/vpn"
alias ocna='vpn connect sea'

# Directories
alias work="cd $HOME/Projects/work"
alias dl="cd $HOME/Downloads"
alias dotfiles="cd $HOME/dotfiles"

# Reload the shell
alias reload="exec ${SHELL}"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
