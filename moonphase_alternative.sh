#!/bin/bash

moon_phase_number()
{
    # Calculates the moon phase (0-7), accurate to 1 segment.
    # 0 = new moon.
    # 4 = full moon.
   
    local year=$1
    local month=$2
    local day=$3

    if [[ $month -eq 1 ]]; then
        ((day--))
    elif [[ $month -eq 2 ]]; then
        ((day+=30))
    else
        ((day+=28+(month-2)*3059/100))

        # adjust for leap years
        if !((year % 4)); then
            ((day++))
        fi
        if !((year % 100)); then
            ((day--))
        fi
    fi
   
    local g=$(( (year-1900) % 19 + 1 ))
    local e=$(( (11*g + 18) % 30 ))
    if (( e == 25 && g > 11 )) || (( e == 24 )); then
        ((e++))
    fi
    echo $((((e + day)*6+11)%177/22 & 7))
}

function moon_phase()
{
    year=$(date +%Y)
    month=4 #$(date +%m)
    day=28 #$(date +%d)

    case $(moon_phase_number $year $month $day) in
    0) echo "🌑";;
    1) echo "🌒";;
    2) echo "🌓";;
    3) echo "🌔";;
    4) echo "🌕";;
    5) echo "🌖";;
    6) echo "🌗";;
    7) echo "🌘";;
    esac
}

function main()
{
    phasename=$(moon_phase $pos)

    echo "$phasename"
}

main "$@"
exit 0
