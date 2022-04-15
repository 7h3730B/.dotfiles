#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Setup displays
# xrandr --setprovideroutputsource modesetting NVIDIA-0 &
# xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --output DP-0 --primary --mode 1920x1080 --rate 144 --right-of HDMI-0 &
xrandr --auto &

# numlockx &
# nitrogen --restore &
# wal -i ~/wallpaper.jpg &
picom &
setxkbmap -layout euro2 &
exec i3 
