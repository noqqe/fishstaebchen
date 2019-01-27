function clean_raw_files

  if test (count *.ARW) -lt 1
    echo "No ARW files found in this dir. You sure you are right here?"
    return
  end

  # Get directory with source JPGs
  set ORIG_DIR $argv[1]

  if test (count $ORIG_DIR/*.JPG) -lt 1 2>/dev/null
    echo "No JPG files found in ORIG_DIR. You sure you gave the right path?"
    return
  end

  # Get list of all files in current dir
  set ORIG_FILES (ls .)

  # Loop over all ARWs and check if corresponding JPG is in ORIG_DIR
  # if not, delete
  for ORIG_FILE in $ORIG_FILES
    set FILENAME (echo $ORIG_FILE | sed 's/.ARW$//g')

    if not test -f {$ORIG_DIR}/{$FILENAME}.JPG
      echo "Did not find $FILENAME.JPG. Deleting $FILENAME.ARW"
      echo rm $FILENAME.ARW
    end
  end
end
