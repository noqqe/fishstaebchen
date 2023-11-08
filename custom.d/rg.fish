# I switched to ripgrep, but for convenience i just use ag
# command anyways.

if command -q rg
  alias srg="rg --no-line-number --no-filename --no-multiline --no-heading"
  alias ag=rg
end
