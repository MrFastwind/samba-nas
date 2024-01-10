
if [[ -z "$UID" ]]; then
UID=65534
fi
if [[ -z "$GID" ]]; then
GID=65534
fi

if ! id "media" >/dev/null 2>&1; then
    groupadd media -g $GID && useradd media -G media -u $UID -D -h /dev/null -s /sbin/nologin
fi

# Start Samba
# F: run in foreground
# S: cause smbd to log to standard output rather than a file
exec smbd -FS