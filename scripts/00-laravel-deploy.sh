#!/usr/bin/env bash
cd /var/www/html

echo "Running composer"
composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev

echo "Installing npm dependencies"
npm ci

echo "Building project"
npm run build

echo "Caching config..."
php artisan config:cache

echo "Caching events..."
php artisan event:cache

echo "Caching routes..."
php artisan route:cache

echo "Caching views..."
php artisan view:cache

echo "Running migrations..."
php artisan migrate --force
