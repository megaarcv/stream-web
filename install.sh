#!/bin/bash

set -e

echo "=================================="
echo "     STREAM WEB INSTALLER"
echo "=================================="

echo "Menginstall Nginx..."
apt update
apt install -y nginx

echo "Menghapus file lama..."
rm -rf /var/www/html/*

echo "Menyalin file..."
cp -r ./* /var/www/html/

echo "Mengatur permission..."
chmod -R 755 /var/www/html

echo "Restart Nginx..."
systemctl enable nginx
systemctl restart nginx

IP=$(hostname -I | awk '{print $1}')

echo ""
echo "=================================="
echo "INSTALL SELESAI!"
echo "Buka browser:"
echo "http://$IP"
echo "=================================="
