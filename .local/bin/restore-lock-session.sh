#!/usr/bin/env bash

if [ "$1" == "kill"]; then
    killall -9 hyprlock 
fi

hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1'
hyprctl --instance 0 'dispatch exec hyprlock'

echo 'Change back to Session with [CTRL]+[ALT]+[FN], where N is the number of tty with session (probably 1)'
