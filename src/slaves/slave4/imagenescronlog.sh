#!/bin/bash

IMAGENES_LOG="/home/moreno/Desktop/Biblio-SB/src/slaves/slave4/imageneslog.log"
CENTRALIZED_LOG="/home/moreno/Desktop/Biblio-SB/src/master/centralizedlogs.log"

if [ -s "$IMAGENES_LOG" ]; then
    cat "$IMAGENES_LOG" >> "$CENTRALIZED_LOG"
    echo "" > "$IMAGENES_LOG"
fi
