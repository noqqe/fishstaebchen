# Alias

alias sl=ls
alias la='ls -AF'
alias ll='ls -al'
alias l='ls -lah'
alias c='clear'
alias x="exit"
alias h='history'

alias reload="source $confdir/config.fish"
alias wttr='curl "wttr.in/~Bayreuth?1qp&lang=de&m"'

# vi like aliases
alias ':q'='exit'
alias ':x'='exit'

# switching convienience
alias ..='cd ..'        # Go up one directory
alias ...='cd ../..'    # Go up two directories
alias ....='cd ../../..'    # Go up three directories
alias .....='cd ../../../..'    # Go up four directories
