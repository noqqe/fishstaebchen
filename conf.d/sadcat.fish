# If sadcat is installed make some aliases that make it
# easier to use. see https://github.com/noqqe/sadcat

if command -q sadcat
  if test -r {$HOME}/.ssh/sadcat.toml

    # set refresh alias
    alias sshre="sadcat $HOME/.ssh/sadcat.toml > $HOME/.ssh/config"

    # set edit alias
    alias sshedit="vim $HOME/.ssh/sadcat.toml"

  end
end
