FROM python:3.13-alpine

WORKDIR /app

# Install dependencies, including mkdocs, nginx, and inotify-tools
RUN apk add --no-cache git nginx inotify-tools \
    && pip install --no-cache-dir mkdocs==1.6.1 mkdocs-publisher==1.4.7 \
    && apk del git

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the file-watching script
COPY watch-and-build.sh /usr/local/bin/watch-and-build.sh
RUN chmod +x /usr/local/bin/watch-and-build.sh

# Expose Nginx port
EXPOSE 80

# Start both the file watcher and Nginx
CMD ["/usr/local/bin/watch-and-build.sh"]

