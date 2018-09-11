# Add calendar shortcut when gcal is installed
# Finally something to show week numbers
#
set BAT (which bat)

if test -x $BAT
  alias cat $BAT
end
