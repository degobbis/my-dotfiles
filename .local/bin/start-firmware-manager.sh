#!/bin/bash

# Zugriff für root erlauben
xhost +si:localuser:root

# firmware-manager starten
firmware-manager

# Zugriff wieder entziehen
xhost -si:localuser:root
