FROM ghost:0.11.4
COPY blog/themes/seedbloom /var/lib/ghost/themes/
COPY docker-entrypoint.sh /entrypoint.sh