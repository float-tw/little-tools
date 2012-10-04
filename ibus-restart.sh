#!/bin/bash
pkill ibus-daemon |nohup ibus-daemon -d &> /dev/null
