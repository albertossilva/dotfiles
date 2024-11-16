if [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
  workspace=$(hyprctl clients -j | jq 'first(.[] | select(.initialClass == "firefox") | .workspace) | .id')

  if [ -n "$workspace" ]; then
    hyprctl dispatch workspace $workspace
    exit
  fi
fi

firefox
