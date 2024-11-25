FROM python:3.13-alpine

WORKDIR /app

RUN apk add --no-cache git \
    && pip install --no-cache-dir mkdocs==1.6.1 mkdocs-publisher==1.4.3 \
    && apk del git

EXPOSE 8000

CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
