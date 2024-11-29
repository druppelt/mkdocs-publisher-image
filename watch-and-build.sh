#!/bin/bash

# Start Nginx in the background
nginx &

# Perform an initial MkDocs build
echo "Running initial MkDocs build..."
mkdocs build

# Debounce delay in seconds (wait time after the last change)
DEBOUNCE_DELAY=3

# Variable to hold the timestamp of the last detected change
LAST_CHANGE_TIMESTAMP=0

# Watch for changes in the /app directory, excluding the /app/site directory
echo "Watching for changes in /app (excluding /app/site)..."
inotifywait -m -r -e modify,create,delete --exclude '/app/site/.*' /app --format '%w%f' | while read file; do
    echo "Change detected in $file."

    # Update the timestamp of the last detected change
    LAST_CHANGE_TIMESTAMP=$(date +%s)

    # Wait for the debounce delay before rebuilding, but keep updating the timestamp if new changes are detected
    while true; do
        # Check if the debounce delay has passed since the last change
        sleep $DEBOUNCE_DELAY

        # If the current time is greater than the timestamp + debounce delay, proceed to rebuild
        if [ $(($(date +%s) - LAST_CHANGE_TIMESTAMP)) -ge $DEBOUNCE_DELAY ]; then
            echo "Rebuilding MkDocs site..."
            mkdocs build
            break
        fi
    done
done &
wait
