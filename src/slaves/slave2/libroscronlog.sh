#!/bin/bash

LIBROS_LOG="/home/moreno/Desktop/Biblio-SB/src/slaves/slave2/libroslog.log"
CENTRALIZED_LOG="/home/moreno/Desktop/Biblio-SB/src/master/centralizedlogs.log"

if [ -s "$LIBROS_LOG" ]; then
    cat "$LIBROS_LOG" >> "$CENTRALIZED_LOG"
    echo "" > "$LIBROS_LOG"
fi
