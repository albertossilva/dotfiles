address=$(hyprctl clients -j | jq -r '.[] | select(.class=="firefox") | .address' | head -n1)

if [ -n "$address" ]; then
   hyprctl eval "hl.dispatch(hl.dsp.focus({ window = \"address:$address\" }))"
  exit
fi

firefox
