# shlib-olsr.sh - OLSR helper functions
# $Id: shlib-olsr.sh 1435 2008-01-21 19:17:29Z jow $

# olsr_neighbours
# Generate a preformat compatible output of current olsrd neighbours.
olsr_neighbours() {
  wget -q -O - http://127.0.0.1:2006/neighbours 2>/dev/null | awk '{ print $1,$2,$3,$4,expr 100 - $4 * 100,100,$5,$6,$7,$8 }' | sed -ne "
    /^Local IP/ {
      s/.*//
      :n
      n 
      /^\([0-9\.]\+[[:space:]]\)\{8\}/ {
        s/[[:space:]]/,/g
        s/,,/,/g
        $(ip addr | grep inet | cut -d ' ' -f6,11 | sed -ne 's/\./\\./g;s/^\(.*\+\)\/[0-9]\+ \(.*\+\)/s\/\1,\/\2,\//p')
        s/,0.00,$/,9999.98,/
        s/,0.00,/,/
        p
        b n
     }
   }
  "
 }
