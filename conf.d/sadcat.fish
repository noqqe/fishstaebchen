# If sadcat is installed make some aliases that make it
# easier to use. see https://github.com/noqqe/sadcat

set SADCAT (which sadcat ^ /dev/null)

if test -x $SADCAT
  if test -r {$HOME}/.ssh/sadcat.toml

    # set refresh alias
    alias sshre="$SADCAT $HOME/.ssh/sadcat.toml > $HOME/.ssh/config"

    # set edit alias
    alias sshedit="vim $HOME/.ssh/sadcat.toml"

  end
end
