#!/usr/bin/env sh
# Do Not Disturb indicator/toggle for the Waybar custom/dnd module.
# Backed by mako modes (see ~/.config/mako/config).

MODE="do-not-disturb"
SIGNAL=8

case "$1" in
    toggle)
        makoctl mode -t "$MODE"
        # Ask Waybar to refresh this module immediately.
        pkill -RTMIN+"$SIGNAL" -x waybar
        ;;
    *)
        if makoctl mode | grep -qx "$MODE"; then
            printf '{"text": "󰂛", "tooltip": "Do Not Disturb: on", "class": "dnd-on"}\n'
        else
            printf '{"text": "󰂚", "tooltip": "Do Not Disturb: off", "class": "dnd-off"}\n'
        fi
        ;;
esac
