# I switched to neovim, but for convenience i just use vim
# command anyways.

set NVIM (which nvim ^ /dev/null)

if test -x $NVIM
  alias vim=$NVIM
  set -x EDITOR $NVIM
  set -x MANPAGER 'nvim +Man!'
  set -x MANWIDTH 80
end
