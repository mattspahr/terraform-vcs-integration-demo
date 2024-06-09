#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Web Server deployed with HCP Terraform VCS Integration!</h1>" > /var/www/html/index.html