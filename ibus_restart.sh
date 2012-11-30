#!/bin/bash
pkill ibus-daemon
sleep 0.5
nohup ibus-daemon --xim -d &> /dev/null
