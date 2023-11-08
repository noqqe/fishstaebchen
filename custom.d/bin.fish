# .bin in home should be sourced.

if test -d "$HOME/.bin"
  set PATH $PATH $HOME/.bin
end
