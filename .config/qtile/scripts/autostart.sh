#!/bin/bash

function run {
  if ! pgrep $1; then
    $@ &
  fi
}

#starting utility applications at boot time
lxsession &
run nm-applet &
run pamac-tray &
numlockx off &
blueman-applet &
#flameshot &
#picom --config $HOME/.config/picom/picom.conf &
picom --config .config/picom/picom-blur.conf --experimental-backends &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dunst &
feh --randomize --bg-fill /usr/share/wallpapers/garuda-wallpapers/*
#nitrogen --random --set-zoom-fill &

#starting user applications at boot time
run volumeicon &
# run /usr/bin/emacs --daemon &
# run emacs --daemon &
# run onedrivegui &
run thunderbird &
#run pcmanfm -d & # auto mount removeable media
run thunar --daemon & # auto mount removeable media

run discord &
run xremap ~/.config/xremap/config.yaml &
#run telegram-desktop &
#run signal-desktop &

# run onedrive --confdir ~/.config/onedrive/accounts/20089137@wit.ie -m &
run rclone --vfs-cache-mode writes mount OneDrive: ~/Onedrive &
run rclone --vfs-cache-mode writes mount GoogleDrive: ~/GoogleDrive &

# colour-temperature setting depending on the time [https://github.com/d4l3k/go-sct]
run sct &
