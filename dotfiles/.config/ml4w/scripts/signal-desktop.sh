#!/bin/bash
pgrep -x signal-desktop > /dev/null || signal-desktop --start-in-tray &
