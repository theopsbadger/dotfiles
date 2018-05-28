# Unix
alias ll="ls -lhaF --color=auto"
alias la="ls -A"
alias l="ls -CF --color=auto"
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

# Grep color
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Reload the shell
alias reload="exec ${SHELL}"

