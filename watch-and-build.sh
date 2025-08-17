#!/bin/sh

# Perform an initial MkDocs build
echo "Running initial MkDocs build..."
mkdocs build
rsync -r --delete /app/site/ /www/

DELAY=2 # seconds to wait
LOCKFILE="/tmp/mkdocs_building"
rm -f $LOCKFILE # Clear any stale lock

# Watch for changes in the /app directory, excluding the /app/site directory
echo "Watching for changes in /app (excluding /app/site)..."
inotifywait -m -r -e modify,create,delete /app/docs --format '%w%f' | while read -r file; do
    echo "Change detected in $file"

    if [ ! -f "$LOCKFILE" ]; then
        touch "$LOCKFILE"
        (
            sleep $DELAY
            echo "Rebuilding MkDocs site..."
            mkdocs build
            rsync -r --delete /app/site/ /www/
            rm -f "$LOCKFILE"
        ) &
    fi
done
