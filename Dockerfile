FROM python:3.13-alpine

WORKDIR /app

# Install dependencies, including mkdocs, nginx, and inotify-tools
RUN apk add --no-cache git inotify-tools rsync \
    && pip install --no-cache-dir mkdocs==1.6.1 mkdocs-publisher==1.4.8 \
    && apk del git

# Copy the file-watching script
COPY watch-and-build.sh /usr/local/bin/watch-and-build.sh
RUN chmod +x /usr/local/bin/watch-and-build.sh

# Start the file watcher
CMD ["/usr/local/bin/watch-and-build.sh"]