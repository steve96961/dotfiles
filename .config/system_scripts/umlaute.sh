#!/bin/bash

umlaut=$(printf  "a: ä\nA: Ä\ne: ë\nE: Ë\ni: ï\nI: Ï\no: ö\nO: Ö\nu: ü\nU: Ü\ny: ÿ\nY: Ÿ\n"|fuzzel --hide-before-typing -l 1 --match-mode fuzzy -d)

echo -n $umlaut|awk -F ': ' '{print $2}'|tr -d '\n'|wl-copy
