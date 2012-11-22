#!/bin/bash
pkill ibus-daemon | nohup ibus-daemon --xim -d &> /dev/null
