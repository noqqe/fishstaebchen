# Variables

set confdir ~/.config/fish/

# Options

set -U FZF_DEFAULT_OPTS "--height 5 -e --inline-info"
set fish_greeting
set -x TERM screen-256color
set -x EDITOR (which nvim ^ /dev/null)
set -x LANG "en_US.UTF-8"

set -x PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/sbin

# Completions
#
set -l completions_vendor /usr/local/share/fish/vendor_completions.d/*

for completion in $completions_vendor
  source $completion
end

# conf.d
#
if test -d $confdir/conf.d/
  source $confdir/conf.d/*.fish
end

# Local source
#
if test -r ~/.fish.local
  source ~/.fish.local
end


