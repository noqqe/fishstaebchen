# Drop in replacement for ls
# Not sure if i like it so far, but i think i give it a try

set EXA (which exa 2>/dev/null)

if test -x "$EXA"

  alias l='exa -lh --git --time-style long-iso'
  alias ls='exa'
  alias tree='exa -lh --git --time-style long-iso --tree'
  alias lr='exa -lh --git --time-style long-iso --tree'

end
