# Alias

alias sl=ls
# alias la='ls -AF'
# alias ll='ls -al'
# alias l='ls -lah'
alias c='clear'
alias x="exit"
alias h='history'

alias re='tmux attach -d -t NOC'
alias reload="source $confdir/config.fish"
alias wttr='curl "wttr.in/~Nuremberg?lang=de&2&Q"'

# vi like aliases
alias ':q'='exit'
alias ':x'='exit'

# switching convienience
alias ..='cd ..'        # Go up one directory
alias ...='cd ../..'    # Go up two directories
