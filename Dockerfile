FROM php:8.3-cli
RUN apt-get update \
    && apt-get install -y --no-install-recommends libsqlite3-dev curl ca-certificates \
    && docker-php-ext-install pdo_sqlite \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . /app
RUN mkdir -p /app/data && chmod -R 775 /app/data
EXPOSE 10000
CMD sh -c 'php -S 0.0.0.0:${PORT:-10000} -t /app/public /app/public/index.php'
