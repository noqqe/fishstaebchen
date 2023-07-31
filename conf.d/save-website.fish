function save-webpage ()
  if command -q wget
    echo "wget not found"
    return
  end
  mkdir -p $argv[2]
  cd $argv[2]
  wget -E -H -k -K -p -nd -nH -p -np $argv[1]
  ln -s (echo $argv[1] | awk -F/ '{print $NF}').html index.html
  cd - 2>/dev/null
end
