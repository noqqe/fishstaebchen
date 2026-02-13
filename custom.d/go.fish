# golang system and directory settings if installed

set -l gohome $HOME/.go/ # thats so nice. go home. thihihi.

if command -q go
  if not test -d "$gohome"
    set -x GOPATH $gohome
    set PATH $PATH {$gohome}bin
  end
end
