# Contains some helpers for find and ag

function qfind -d "Easily fuzzy search for a filename" -a "string"
  for key in $argv
    find . -iname "*$key*"
  end
end

function rgvim -d "Search, vim and highlight recursively in dir using ag" -a 'string'
  for key in $argv
    set -l cmd $EDITOR +/"$argv" (rg -l "$argv")
    eval $cmd
  end
end
