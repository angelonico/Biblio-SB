#!/bin/bash

PDF_LOG="/home/moreno/Desktop/Biblio-SB/src/slaves/slave1/pdflog.log"
CENTRALIZED_LOG="/home/moreno/Desktop/Biblio-SB/src/master/centralizedlogs.log"

if [ -s "$PDF_LOG" ]; then
    cat "$PDF_LOG" >> "$CENTRALIZED_LOG"
    echo "" > "$PDF_LOG"
fi
