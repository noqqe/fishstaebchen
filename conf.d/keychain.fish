# This should handle my ssh agent running on this host
if test -x (which keychain) ; and status --is-interactive;
  [ -e $HOME/.keychain/(hostname)-fish ]; and source $HOME/.keychain/(hostname)-fish
end
