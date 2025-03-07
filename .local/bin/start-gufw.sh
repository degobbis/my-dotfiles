#!/bin/bash

# Zugriff für root erlauben
xhost +si:localuser:root

# gufw starten
#pkexec gufw-pkexec
gufw

# Zugriff wieder entziehen
xhost -si:localuser:root
