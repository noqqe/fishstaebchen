# I want to use
# sudo !!
# to repeat commands and the like which is not possible in fish atm
# However someonewrote a nice script that simulates this behaviour
#
# https://github.com/fish-shell/fish-shell/issues/288#issuecomment-306212011

function last_history_item; echo $history[1]; end 
abbr -a !! --position anywhere --function last_history_item

# Binding for this function must happen in
# .config/fish/functions/fish_user_key_bindings.fish
