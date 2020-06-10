# Enable direnv https://direnv.net/docs/hook.html
if test -x (which direnv);
  eval (direnv hook fish)
end
