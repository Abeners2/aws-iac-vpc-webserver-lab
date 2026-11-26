#!/bin/bash
set -euo pipefail

dnf update -y
dnf install -y nginx amazon-cloudwatch-agent

cat << 'EOF' > /etc/nginx/conf.d/healthz.conf
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name _;

    location = /healthz {
        default_type application/json;
        return 200 '{"status":"ok","service":"nginx","project":"${project_name}","env":"${environment}"}\n';
    }

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
EOF

cat << 'EOF' > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><title>${project_name}</title></head>
<body style="font-family:sans-serif;max-width:640px;margin:48px auto;">
  <h1>AWS IaC VPC Webserver Lab</h1>
  <p><strong>Project:</strong> ${project_name} (${environment})</p>
  <p><strong>Logs Bucket:</strong> ${logs_bucket}</p>
  <p><strong>Health Endpoint:</strong> <a href="/healthz">/healthz</a></p>
</body>
</html>
EOF

rm -f /etc/nginx/conf.d/default.conf
nginx -t
systemctl enable --now nginx
