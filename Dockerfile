FROM ghost:0.11.4
COPY blog /var/lib/ghost
COPY docker-entrypoint.sh /entrypoint.sh