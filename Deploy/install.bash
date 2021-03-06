#!/bin/bash
set -x
PJNAME="Article"
PORT="1111"
LOCAL="laravel"
if false;then
cp -a $PJNAME  /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/$PJNAME /etc/nginx/sites-enabled/
fi
cd /var/$LOCAL/$PJNAME
mkdir -p storage/framework/views
mkdir -p storage/framework/sessions
mkdir -p storage/framework/cache
chmod -R 777  storage/
sudo composer dump-autoload -o
sudo php artisan clear-compiled
sudo php artisan cache:clear
php artisan migrate:install

