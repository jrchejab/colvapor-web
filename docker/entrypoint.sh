#!/bin/sh
set -e

# Initialize public/img from image defaults (volume may be empty)
if [ ! -d /var/www/html/public/img ]; then
    mkdir -p /var/www/html/public
    cp -r /var/www/html/public-img-default /var/www/html/public/img
fi

# Ensure required storage directories exist
mkdir -p /var/www/html/storage/logs
mkdir -p /var/www/html/storage/framework/cache/data
mkdir -p /var/www/html/storage/framework/sessions
mkdir -p /var/www/html/storage/framework/testing
mkdir -p /var/www/html/storage/framework/views
mkdir -p /var/www/html/storage/app/public

# Fix permissions
chmod -R 775 /var/www/html/storage
chown -R www-data:www-data /var/www/html/content /var/www/html/resources/forms /var/www/html/storage
chmod -R 775 /var/www/html/content /var/www/html/resources/forms

exec "$@"
