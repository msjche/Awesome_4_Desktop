#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run "megasync"
run "xscreensaver --no-splash"
run "/usr/bin/dropbox"
run "insync start"
run "compton"
#run "/usr/bin/redshift"
run "urxvtd -q -f -o"
run "mpd"
run "nm-applet"
pkill conky

sleep 3
#run "conky -c /home/msjche/.config/awesome/conky/conkyrc"
run "conky -c /home/msjche/.config/awesome/conky/conkyrc.lua"
sleep 1
run "conky -c /home/msjche/.config/awesome/conky/conkyrcr"
run "conky -c /home/msjche/.config/awesome/conky/conkyrc"
