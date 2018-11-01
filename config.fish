# Variables

set confdir ~/.config/fish/
set completionsdir /usr/local/share/fish/vendor_completions.d/

# Options

set -U FZF_DEFAULT_OPTS "--height 5 -e --inline-info"
set -x TERM screen-256color
set -x EDITOR (which vim ^ /dev/null)
set -x LANG "en_US.UTF-8"

set -x PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /usr/local/sbin

# Completions
#
if test -d $completionsdir
  source $completionsdir/*
end

# conf.d
#
if test -d $confdir/conf.d/
  source $confdir/conf.d/*
end

# Local source
#
if test -r ~/.fish.local
  source ~/.fish.local
end


