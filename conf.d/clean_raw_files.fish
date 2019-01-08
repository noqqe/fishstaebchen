function clean_raw_files
  # Get directory with source JPGs
  set ORIG_DIR $argv[1]

  # Get list of all files in current dir
  set ORIG_FILES (ls .)

  # Loop over all ARWs and check if corresponding JPG is in ORIG_DIR
  # if not, delete
  for ORIG_FILE in $ORIG_FILES
    set FILENAME (echo $ORIG_FILE | sed 's/.ARW$//g')

    if not test -f {$ORIG_DIR}/{$FILENAME}.JPG
      echo "Did not find $FILENAME.JPG. Deleting $FILENAME.ARW"
      rm $FILENAME.ARW
    end
  end
end
