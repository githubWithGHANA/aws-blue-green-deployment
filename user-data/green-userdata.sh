#!/bin/bash
sudo -s
yum install -y httpd
yum install -y wget
wget --content-disposition https://templatemo.com/download/templatemo_577_liberty_market
yum install -y unzip
unzip templatemo_577_liberty_market.zip
cp -r templatemo_577_liberty_market/* /var/www/html
systemctl enable httpd
systemctl start httpd
