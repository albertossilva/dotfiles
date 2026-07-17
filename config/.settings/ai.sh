firefox https://chat.openai.com

address=$(hyprctl clients -j | jq -r '.[] | select(.class=="firefox") | .address' | head -n1)

hyprctl eval "hl.dispatch(hl.dsp.focus({ window = \"address:$address\" }))"

