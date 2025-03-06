# new prompt
if command -q starship;
  source (starship init fish --print-full-init | psub)
end
