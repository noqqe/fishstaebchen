# Drop in replacement for ls
# Not sure if i like it so far, but i think i give it a try


if command -q exa
  alias l='exa -lh --git --time-style long-iso --all'
  alias ls='exa'
  alias tree='exa -lh --git --time-style long-iso --tree --all'
  alias lr='exa -lh --git --time-style long-iso --tree --all'
  alias lslahtr='exa -lh --all --git --time-style long-iso --sort newest'
end
