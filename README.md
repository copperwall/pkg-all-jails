# pkg-all-jails

This is a short script to run `pkg update` and `pkg upgrade` on each running
jail on a FreeBSD system.

This doesn't need any configuration, because it grabs the JIDs from `jls`.
