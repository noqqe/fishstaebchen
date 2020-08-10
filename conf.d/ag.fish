# I switched to neovim, but for convenience i just use vim
# command anyways.

set AG (which ag ^ /dev/null)

if test -x $AG
  alias sag="ag --nonumbers --nobreak --nofilename"
end
