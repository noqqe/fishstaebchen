# backups files and dirs with timestamp

function bup
  if test -f $argv ; or test -d $argv
    cp -a $argv $argv-(date +%F-%H-%M-%S)
  end
end
