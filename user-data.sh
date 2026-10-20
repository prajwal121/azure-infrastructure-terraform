#!/bin/bash
set -eux

apt-get update -y
apt-get install -y apache2 php php-curl libapache2-mod-php php-mysql jq

systemctl enable --now apache2

mkdir -p /var/www/html

cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Azure Infrastructure Project</title>
</head>
<body>
    <h1>Advanced Azure Infrastructure with Terraform</h1>
    <p>Apache is running successfully on an Azure VM Scale Set instance.</p>
</body>
</html>
EOF

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
