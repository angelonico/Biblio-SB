#!/bin/bash

VIDEOS_LOG="/home/moreno/Desktop/Biblio-SB/src/slaves/slave3/videoslog.log"
CENTRALIZED_LOG="/home/moreno/Desktop/Biblio-SB/src/master/centralizedlogs.log"

if [ -s "$VIDEOS_LOG" ]; then
    cat "$VIDEOS_LOG" >> "$CENTRALIZED_LOG"
    echo "" > "$VIDEOS_LOG"
fi
