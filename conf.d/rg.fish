# I switched to ripgrep, but for convenience i just use ag
# command anyways.

set RG (which rg ^ /dev/null)

if test -x $RG
  alias srg="$RG --no-line-number --no-filename --no-multiline --no-heading"
  alias ag=$RG
end
