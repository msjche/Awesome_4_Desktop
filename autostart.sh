#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#run "megasync"
run "/usr/bin/xscreensaver --no-splash"
run "/usr/bin/dropbox"
run "insync start"
run "compton"
run "/usr/bin/redshift"
run "urxvtd -q -f -o"
run "/usr/bin/mpd"
run "nm-applet"
pkill conky

sleep 3
run "conky -c /home/msjche/.config/awesome/conky/conkyrcl.lua"
sleep 1
run "conky -c /home/msjche/.config/awesome/conky/conkyrcr.lua"
