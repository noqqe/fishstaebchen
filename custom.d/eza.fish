# Drop in replacement for ls
# Not sure if i like it so far, but i think i give it a try

if command -q eza
  alias l='eza -lh --git --time-style long-iso --all --icons auto'
  alias ls='eza'
end
