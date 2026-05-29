FROM ubuntu:22.04

RUN apt update && apt install -y \
    nginx \
    libsqlite3-0 \
    libjansson4 \
    && rm -rf /var/lib/apt/lists/*

COPY dist/backend /app/backend
COPY dist/frontend /var/www/html

COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
COPY deploy/start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 80 8080

CMD ["/start.sh"]
