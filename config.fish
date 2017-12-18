# Variables

set confdir ~/.config/fish/
set completionsdir /usr/local/share/fish/vendor_completions.d/

# Options

set -U FZF_DEFAULT_OPTS "--height 5 -e --inline-info"
set TERM screen-256color
set EDITOR (which vim ^ /dev/null)



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

