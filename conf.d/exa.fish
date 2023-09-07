# Drop in replacement for ls
# Not sure if i like it so far, but i think i give it a try

if command -q eza
  alias l='eza -lh --git --time-style long-iso --all'
  alias ls='eza'
  alias tree='eza -lh --git --time-style long-iso --tree --all'
  alias lr='eza -lh --git --time-style long-iso --tree --all'
  alias lslahtr='eza -lh --all --git --time-style long-iso --sort newest'
end
