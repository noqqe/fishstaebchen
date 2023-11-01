function convert_heic_to_jpg 
  for x in $argv
    set new_name (echo $x | string replace heic jpg)
    convert $x $new_name
    rm $x 
  end
end

