#!/bin/bash
sudo -s
yum install -y httpd
yum install -y wget
wget --content-disposition https://templatemo.com/download/templatemo_571_hexashop
yum install -y unzip
unzip templatemo_571_hexashop.zip
cp -r templatemo_571_hexashop/* /var/www/html
systemctl enable httpd
systemctl start httpd
