#!/bin/bash

umlaut=$(printf  "1: Ä\n2: ä\n3: Ë\n4: ë\n5: Ï\n5: ï\n6: Ö\n7: ö\n8: Ü\n9: ü\n10: Ÿ\n11: ÿ"|fuzzel -d)

echo -n $umlaut|awk -F ': ' '{print $2}'|tr -d '\n'|wl-copy
