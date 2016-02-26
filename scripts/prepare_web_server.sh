#!/bin/bash

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/aws-application.conf

cat << EOF > /etc/apache2/sites-available/aws-application.conf
<VirtualHost *:80>
    <Directory /var/aws-application/ >
        AllowOverride All
        Order Deny,Allow
        Allow from All
        Require all granted
    </Directory>
    DocumentRoot /var/aws-application
    CustomLog /dev/null common
</VirtualHost>
EOF

a2ensite aws-application.conf

service apache2 reload