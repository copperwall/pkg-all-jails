#!/bin/sh

# date for log purposes
date +"%Y%m%d-%H%M%S"

# Grab JailNamesfrom all running jails.
JAILS="$(jls | awk 'NR>1 {print $3}')"

# Run pkg update/upgrade on all JIDs.
for JAIL in $JAILS; do
   jexec $JAIL pkg update
   jexec $JAIL pkg upgrade -y
   sed -n '/AUTO RESTART/,$p' /mnt/jails/$JAIL/etc/rc.conf | perl -M5.010 -ne 'next unless /YES/i; next unless /([\w_]+)_enable/; say $1;' | xargs -I % jexec $JAIL service % restart
done
