# I switched to neovim, but for convenience i just use vim
# command anyways.


if command -q nvim
  alias vim=nvim
  set -x EDITOR nvim
  set -x MANPAGER 'nvim +Man!'
  set -x MANWIDTH 80
end
