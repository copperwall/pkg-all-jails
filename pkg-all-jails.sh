#!/bin/sh

# Grab JIDs from all running jails.
JAILS="$(jls | awk 'NR>1 {print $1}')"

# Run pkg update/upgrade on all JIDs.
for $JAIL in $JAILS; do
   sudo jexec $JAIL pkg update
   sudo jexec $JAIL pkg upgrade
done
