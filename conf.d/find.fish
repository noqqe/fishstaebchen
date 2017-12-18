# Contains some helpers for find and ag
set -l F (which find)

function qfind -d "Easily fuzzy search for a filename" -a "string"
  for key in $argv
    find . -iname "*$key*"
  end
end

function agvim -d "Search, vim and highlight recursively in dir using ag" -a 'string'
  for key in $argv
    set -l cmd $EDITOR +/"$argv" (ag -l "$argv")
    eval $cmd
  end
end
