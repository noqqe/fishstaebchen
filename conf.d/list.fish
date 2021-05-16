
function mtglist
  echo -ne "Gesamt: \t" ; grep -c '^-' $argv[1]
  echo -ne "Gesammelt: \t" ; grep -c '^- \[x\]' $argv[1]
  echo -ne "Bestellt: \t" ; grep -c '^-.* X' $argv[1]
  echo -ne "Offen: \t\t" ; grep '^- \[ \]' $argv[1] | grep -vc ' X'

  echo
  echo "Offene: " ; grep '^- \[ \]' $argv[1] | grep -v ' X' | head -20

end
