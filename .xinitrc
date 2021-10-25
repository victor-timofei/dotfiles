#!/bin/sh

# JetBrains IDE fix
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

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

xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don't blank the video device
xset s off         # disable screensaver

# Try to use the same scaling as my 4K monitor on my 768 laptop monitor
xrandr --dpi 150 \
	--output eDP1 --scale 1.5x1.5

# Restore my background
nitrogen  --restore &

# Start the compositor
# picom fork https://aur.archlinux.org/packages/picom-ibhagwan-git/
picom --experimental-backends &

# Start xscreensaver
#xscreensaver --no-splash &

# Load keybinds
#xbindkeys

# Start dwmblocks
dwmblocks &

# Export some paths here that need to be picked up by
# the dmenu
export PATH=$PATH:/home/vtimofei/firefox

# Finally exec my window manager
exec dwm
