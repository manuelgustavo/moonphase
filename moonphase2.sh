#!/bin/bash
set -x
# Calculates the moon phase (0-7), accurate to 1 segment.
# 0 = new moon.
# 4 = full moon.

y=$1
m=$2
d=$3

if [ $m -lt 3 ]; then
  y=$((y-1))
  m=$((m+12))
fi

m=$((m+1))
c=$(bc <<< "365.25*$y")
e=$(bc <<< "30.6*$m")
jd=$(bc <<< "$c+$e+$d-694039.09")
jd=$(bc <<< "$jd/29.53")
b=$(bc <<< "$jd/1")
jd=$(bc <<< "$jd-b")
b=$(bc <<< "($jd*8+0.5)/1")
b=$(bc <<< "$b%8")
# if [ $b -eq 8 ]; then
#   b=0
# fi

echo $b





#include <iostream>

# using namespace std;

# int moon_phase(int y, int m, int d)
# {
#     /*
#       calculates the moon phase (0-7), accurate to 1 segment.
#       0 = > new moon.
#       4 => full moon.
#       */

#     int c,e;
#     double jd;
#     int b;

#     if (m < 3) {
#         y--;
#         m += 12;
#     }
#     ++m;
#     c = 365.25*y;
#     e = 30.6*m;
#     jd = c+e+d-694039.09;  /* jd is total days elapsed */
#     jd /= 29.53;           /* divide by the moon cycle (29.53 days) */
#     b = jd;		   /* int(jd) -> b, take integer part of jd */
#     jd -= b;		   /* subtract integer part to leave fractional part of original jd */
#     b = jd*8 + 0.5;	   /* scale fraction from 0-8 and round by adding 0.5 */
#     b = b & 7;		   /* 0 and 8 are the same so turn 8 into 0 */
#     return b;
# }
# //i developed this algorithm using floating point rather than integer for use in pocket calculators and only just managed to fit inside the fx-201p. an older, but integer formula is the following:

# int Moon_phase(int year,int month,int day)
# {
#     /*k
#       Calculates the moon phase (0-7), accurate to 1 segment.
#       0 = > new moon.
#       4 => Full moon.
#     */
   
#     int g, e;

#     if (month == 1) --day;
#     else if (month == 2) day += 30;
#     else // m >= 3
#     {
#         day += 28 + (month-2)*3059/100;

#         // adjust for leap years
#         if (!(year & 3)) ++day;
#         if ((year%100) == 0) --day;
#     }
   
#     g = (year-1900)%19 + 1;
#     e = (11*g + 18) % 30;
#     if ((e == 25 && g > 11) || e == 24) e++;
#     return ((((e + day)*6+11)%177)/22 & 7);
# }

# int main()
# {
#     auto m = Moon_phase( 2023, 4, 26);
#     cout << m << "\n";

#     if (true)
#         cout << "test2";
#     else

#     return 0;
# }