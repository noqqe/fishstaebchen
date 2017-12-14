# Contains some helpers for find and ag
set -l F (which find)

# Easily fuzzy search for a filename
function qfind
  for key in $argv
    find . -iname "*$key*"
  end
end

function agvim
  for key in $argv
    set -l cmd $EDITOR +/"$argv" (ag -l "$argv")
    eval $cmd
  end
end
