# Create a thumbnail image for all pictures in current folder
function create_blog_photos ()

  # fix file extension names
  for jpeg in *.jpeg
    mv $jpeg (echo $jpeg |sed 's/\.jpeg$/.jpg/')
  end

  for jpeg in *.JPG
    mv $jpeg (echo $jpeg |sed 's/\.JPG$/.jpg/')
  end

  # generate thumbnail
  for x in *.jpg
    convert -resize 3000x -quality 95 $x $x
  end
end
