# Sets the terminal title to command executed at the moment.
#
# This way is see "ssh root@host" in my iTerm when being logged in into another host

function fish_title
   echo $argv[1]
end
