#!/bin/bash
sleep 1

# kill all possible running xdg-desktop-portals
killall -e xdg-desktop-portal-gnome
killall -e xdg-desktop-portal-wlr
killall -e xdg-desktop-portal-gtk
killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal

[[ "$1" == "kill" ]] && exit 0

# start xdg-desktop-portal
/usr/lib/xdg-desktop-portal &
sleep 1

# ps aux | grep xdg-desktop

# echo ":: Starting dbus-update-activation-environment"
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
# _envs=(
#   # display
#   WAYLAND_DISPLAY
#   DISPLAY
#   # xdg
#   USERNAME
#   XDG_BACKEND
#   XDG_CURRENT_DESKTOP
#   XDG_SESSION_TYPE
#   XDG_SESSION_ID
#   XDG_SESSION_CLASS
#   XDG_SESSION_DESKTOP
#   XDG_SEAT
#   XDG_VTNR
#   # hyprland
#   HYPRLAND_CMD
#   HYPRLAND_INSTANCE_SIGNATURE
# )

#systemctl --user status pipewire wireplumber dbus-update-activation-environment --systemd "${_envs[@]}"
# dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
# dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
