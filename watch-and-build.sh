#!/bin/sh

# Start Nginx in the background
nginx &

# Perform an initial MkDocs build
echo "Running initial MkDocs build..."
mkdocs build

DELAY=2 # seconds to wait
LOCKFILE="/tmp/mkdocs_building"
rm -f $LOCKFILE # Clear any stale lock

# Watch for changes in the /app directory, excluding the /app/site directory
echo "Watching for changes in /app (excluding /app/site)..."
inotifywait -m -r -e modify,create,delete --exclude '/app/site/.*' /app --format '%w%f' | while read -r file; do
    echo "Change detected in $file"

    if [ ! -f "$LOCKFILE" ]; then
        touch "$LOCKFILE"
        (
            sleep $DELAY
            echo "Rebuilding MkDocs site..."
            mkdocs build
            rm -f "$LOCKFILE"
        ) &
    fi
done
