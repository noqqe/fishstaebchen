# Enable direnv https://direnv.net/docs/hook.html
if command -q direnv
  eval (direnv hook fish)
end
