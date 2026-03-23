# Variables

set confdir ~/.config/fish/

# Options

set fish_greeting
set -x EDITOR vim
set -x LANG "en_US.UTF-8"


# if running on nixos 
if command -q nixos-version 
  set -x PATH /run/wrappers/bin /home/$USER/.nix-profile/bin /nix/profile/bin /home/$USER/.local/state/nix/profile/bin /etc/profiles/per-user/$USER/bin /nix/var/nix/profiles/default/bin /run/current-system/sw/bin
else
  set -x PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/sbin 
end 


# https://github.com/fish-shell/fish-shell/issues/6950
set -g fish_escape_delay_ms 300

# Local source
#
if test -r ~/.fish.local
  source ~/.fish.local
end

# Completions
set -l completions_vendor /usr/local/share/fish/vendor_completions.d/*

for completion in $completions_vendor
  source $completion
end

# custom.d
#
for custom in $confdir/custom.d/*.fish
  source $custom
end

# conf.d
#
if test -d $confdir/conf.d/
  source $confdir/conf.d/*.fish
end

