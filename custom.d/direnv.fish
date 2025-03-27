# Enable direnv https://direnv.net/docs/hook.html
if command -q direnv
  set -x DIRENV_WARN_TIMEOUT 20s 
  eval (direnv hook fish)
end
