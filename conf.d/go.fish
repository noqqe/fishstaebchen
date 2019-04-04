# golang system and directory settings if installed

set -l gopath (which go 2>/dev/null)
set -l gohome $HOME/.go/ # thats so nice. go home. thihihi.

if test -x "$gopath"
  if not test -d "$gohome"
    mkdir $gohome
  end
  set -x GOPATH $gohome
  set PATH $PATH $gohome/bin
end
