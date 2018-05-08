# Add calendar shortcut when gcal is installed
# Finally something to show week numbers
#
set CAL (which gcal)

if test -x $CAL
  alias cal "gcal -K -s Mo .+"
end
