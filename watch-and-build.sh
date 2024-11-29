#!/bin/sh

# Start Nginx in the background
nginx &

# Perform an initial MkDocs build
echo "Running initial MkDocs build..."
mkdocs build

# Watch for changes in the /app directory, excluding the /app/site directory
echo "Watching for changes in /app (excluding /app/site)..."
inotifywait -m -r -e modify,create,delete --exclude '/app/site/.*' /app --format '%w%f' | while read file; do
    echo "Change detected in $file. Rebuilding MkDocs site..."
    mkdocs build
done
