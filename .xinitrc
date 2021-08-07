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

if [[ $(xrandr -q | grep 'HDMI2 connected') ]]; then
xrandr --output eDP1 --primary --mode 1366x768 --rotate normal --output HDMI2 --mode 1920x1080 --rotate normal --left-of eDP1
fi

xinput --set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1
xsetroot -cursor_name left_ptr
nitrogen --restore &

imwheel --kill &
picom &
redshift -c ~/.config/redshift.conf &
exec bspwm
