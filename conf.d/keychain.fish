# This should handle my ssh agent running on this host
if test -x (which keychain ^ /dev/null) ; and status --is-interactive;
  [ -e $HOME/.keychain/(hostname)-fish ]; and source $HOME/.keychain/(hostname)-fish

  # Look for all keys and add them to the agent

  set -l keys (grep -l "PRIVATE KEY---" ~/.ssh/* 2>/dev/null)
  for key in $keys ;
    ssh-add $key ^/dev/null
  end

end
