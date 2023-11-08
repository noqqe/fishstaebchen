# I want to use
# sudo !!
# to repeat commands and the like which is not possible in fish atm
# However someonewrote a nice script that simulates this behaviour
#
# https://github.com/fish-shell/fish-shell/issues/288#issuecomment-306212011

function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

# Binding for this function must happen in
# .config/fish/functions/fish_user_key_bindings.fish
