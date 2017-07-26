#!/bin/bash
# author: Dior
# mail: todaycoder@163.com
# function: Create Site
if [ -z $1 ] || [ -z $2 ];
then
   echo "Param1: the domain name which you want create."
   echo "Param2: the site filename which you want create."
   exit
fi
DOMAIN_NAME=$1
SITE_FILENAME=$2
mkdir -p /var/www/$SITE_FILENAME
cp /var/www/html/index.php /var/www/$SITE_FILENAME/index.php
cd /etc/apache2/sites-available/
sed "s/@DOMAIN_NAME/${DOMAIN_NAME}/g" site.templet.conf | sed "s/@SITE_FILENAME/${SITE_FILENAME}/g" > ${SITE_FILENAME}.conf
a2ensite ${SITE_FILENAME}.conf
service apache2 reload
