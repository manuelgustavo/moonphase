#!/bin/bash

# moonphase.sh - Calculate Lunar Phase
# Adapted from http://inamidst.com/code/moonphase.py

# Cf. http://en.wikipedia.org/wiki/Lunar_phase#Lunar_phase_calculation

function position() {
now=$(date +%s)
diff=$(( now - $(date -d "2001-01-01" +%s) ))
days=$(echo "scale=15; $diff/86400" | bc)
lunations=$(echo "scale=15; 0.20439731 + $days*0.03386319269" | bc)
echo "$lunations % 1" | bc
}

function phase() {
index=$(echo "scale=15; $1*8 + 0.5" | bc | cut -f1 -d".")
case $(( index & 7 )) in
0) echo "New Moon";;
1) echo "Waxing Crescent";;
2) echo "First Quarter";;
3) echo "Waxing Gibbous";;
4) echo "Full Moon";;
5) echo "Waning Gibbous";;
6) echo "Last Quarter";;
7) echo "Waning Crescent";;
esac
}

function main() {
pos=$(position)
phasename=$(phase $pos)

roundedpos=$(echo "scale=3; $pos" | bc)
echo "$phasename $roundedpos"
}

main "$@"
exit 0
