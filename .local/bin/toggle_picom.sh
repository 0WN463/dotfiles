#!/usr/bin/zsh
if [[ -n "$(pidof picom)" ]]
then
  #polybar-msg hook blur-toggle 1
  pkill -9 picom
else
  #polybar-msg hook blur-toggle 2
  picom & 
fi
