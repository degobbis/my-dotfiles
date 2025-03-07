#!/bin/bash
pgrep -x nextcloud > /dev/null || nextcloud --background &
