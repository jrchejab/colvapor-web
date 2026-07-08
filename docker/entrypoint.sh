#!/bin/sh
set -e

# Ensure required storage directories exist
mkdir -p /var/www/html/storage/logs
mkdir -p /var/www/html/storage/framework/cache/data
mkdir -p /var/www/html/storage/framework/sessions
mkdir -p /var/www/html/storage/framework/testing
mkdir -p /var/www/html/storage/framework/views
mkdir -p /var/www/html/storage/app/public

# Fix permissions
chmod -R 775 /var/www/html/storage

exec "$@"
