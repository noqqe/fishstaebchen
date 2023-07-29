# A convinient way to get superuser on different systems for
# me by just typing "s". As im using OpenBSD (doas) this needs to
# be a plugin.

if command -q sudo
  alias s="sudo -Es"
end

if command -q doas
  alias s="doas -s"
end
