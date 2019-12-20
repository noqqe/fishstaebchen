# Add calendar shortcut when gcal is installed
# Finally something to show week numbers
#
set CAL (which gcal 2>/dev/null)

if test -x $CAL
  alias cal "gcal -K -s Mo .+"
end
