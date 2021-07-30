# Onepassword CLI for fish

if test -x (which op)

  # This function requires the first inital login to be done manually
  # https://support.1password.com/command-line-getting-started/
  # Found https://1password.community/discussion/81823/op-and-fish-shell-environment
  # but it only has garbage functions in it.
  function op_signin
    set session (op signin my --raw)
    set -gx "OP_SESSION_my" "$session"
  end

end
