# A convinient way to get superuser on different systems for
# me by just typing "s". As im using OpenBSD (doas) this needs to
# be a plugin.

set DOAS (which doas ^ /dev/null)
set SUDO (which sudo ^ /dev/null)

if not test -z $SUDO
  alias s="sudo -Es"
end

if not test -z $DOAS
  alias s="doas -s"
end
