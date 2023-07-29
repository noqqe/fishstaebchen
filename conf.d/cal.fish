# Add calendar shortcut when gcal is installed
# Finally something to show week numbers

if command -q gcal
  alias cal "gcal -K -s Mo .+"
end
