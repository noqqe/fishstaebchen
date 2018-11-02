# Create a thumbnail image for all pictures in current folder
function create_thumbs ()
  for x in *.jpg
    set -l tn_name (echo $x | sed 's/\.jpg/-thumb.jpg/')
    convert $x -define jpeg:size=300x300 -thumbnail '300x300>' $tn_name
  end
end
